latRange = 1:1:320;
pLevel   = 11; % 9->208.5 mb for 30 unevenly spaced sigma
%%
archiveDir = '/archive/Junyi.Chai/sigmaCoord/2014/Feb28e_jupiter/';
files   = {[archiveDir 'Feb28e_jupiter_seg35.nc'],...
           [archiveDir 'Feb28e_jupiter_seg36.nc'],...
           [archiveDir 'Feb28e_jupiter_seg37.nc'],...
           [archiveDir 'Feb28e_jupiter_seg38.nc'],...
           [archiveDir 'Feb28e_jupiter_seg39.nc'],...
           [archiveDir 'Feb28e_jupiter_seg40.nc']};
vcomp = read_files(files,'vcomp',pLevel,latRange);
ucomp = read_files(files,'ucomp',pLevel,latRange);
lat = ncread(files{1}, 'lat');
% momentum flux cross spectrum


numPoints= 150; % number of points for phase speed spectrum
numLon   = 640;
numTime  = 1500;

NFFT_time= 200;
dwindow  = 250;
RADIUS   = 69911e3; % unit m
timeUnit = 2*24*3600;

P_Cpp2d = zeros(numPoints,length(latRange));
P_Cpn2d = zeros(numPoints,length(latRange));

clear K_p3d
clear K_n3d

for i = 1:length(latRange)
    disp(num2str(i));
    vslice = reshape(vcomp(:,i,:),numLon,numTime);
    uslice = reshape(ucomp(:,i,:),numLon,numTime);
    Umean  = sum(uslice,1)/numLon;
    Umean2d= repmat(Umean,[numLon 1]);
    uslice = uslice-Umean2d;
    Vmean  = sum(vslice,1)/numLon;
    Vmean2d= repmat(Vmean,[numLon 1]);
    vslice = vslice-Vmean2d;
    
    [K_p K_n fre_lon omega] = ...
        spaceTimeCrossSpec(vslice,uslice,dwindow,NFFT_time);
    
%    lonUnit = 2*pi*RADIUS*cos(lat(latRange(i))*pi/180)/numLon;
    lonUnit = 2*pi*RADIUS/numLon;
    [P_Cp P_Cn phaseSpeed]    = calPhaseSpeedSpectrum(K_p,K_n, ...
                            fre_lon,omega,lonUnit,timeUnit,numPoints);
    P_Cpp2d(:,i) = P_Cp;
    P_Cpn2d(:,i) = P_Cn;
end

%
figure
%contourf(lat(latRange),phaseSpeed,P_Cpp2d);
%hold on
%contourf(lat(latRange),-phaseSpeed,P_Cpn2d);
combCp2d = zeros(2*size(P_Cpp2d, 1), size(P_Cpn2d, 2));
combCp2d(1:size(P_Cpp2d, 1),:)     = flipud(P_Cpn2d);
combCp2d(size(P_Cpp2d, 1)+1:end,:) = P_Cpp2d;
combPhaseSpeed = zeros(1,length(phaseSpeed)*2);
combPhaseSpeed(1:size(P_Cpp2d, 1)) = fliplr(-phaseSpeed);
combPhaseSpeed(size(P_Cpp2d, 1)+1:end) = phaseSpeed;
% make plot
contourf(lat(latRange), combPhaseSpeed, combCp2d);
hold on
ylim([-95 65])
xlabel('Latitude')
ylabel('Phase speed/cos(\theta) (m/s)');
if ~exist('umean','var')
umean = squeeze(mean(mean(ucomp, 1), 3))';
end
plot(lat(latRange),umean./cos(lat(latRange)*pi/180),'k')

%
save('/home/j1c/plotResults/zerofriction_paper/momenum_flux_cospectra/Feb28e_sigma=11.mat',...
    'lat', 'latRange', 'combPhaseSpeed', 'combCp2d', 'umean', 'pLevel','latRange')