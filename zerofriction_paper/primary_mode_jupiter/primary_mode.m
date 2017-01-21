filePrefix  = 'Feb28e_jupiter_seg';
segSet      = 35:1:40;
archiveDir  = '/archive/j1c/sigmaCoord/2014/Feb28e_jupiter/';
saveDir     = '/home/j1c/analysis/2014/Feb28/e/TSFilter/';

refLat      = 275;
refSigma    = 4;
numLat      = 320;
numLon      = 640;
fRange      = [1/20 1/2];
kRange      = [5 8];

mkdir(saveDir)
%%
countLength = 1;
for segCounter = segSet
  fileID = [archiveDir filePrefix num2str(segCounter) '.nc']
  tmp = ncread(fileID,'ucomp');
  ucomp(:,:,:,countLength:size(tmp,4)+countLength-1) = tmp;
  tmp = ncread(fileID,'vcomp');
  vcomp(:,:,:,countLength:size(tmp,4)+countLength-1) = tmp;
  %tmp = ncread(fileID,'omega');
  %omega(:,:,:,countLength:size(tmp,4)+countLength-1) = tmp;
  
  countLength = countLength + size(tmp,4);
end
%%
refField = ucomp(:,refLat,refSigma,:);
refVar     = squeeze(refField);
filtRefVar = space_time_filter(refVar,fRange,kRange);

% normalize the time series to regress onto
filtRefVar1d = filtRefVar(160,:);
filtRefVar1d = filtRefVar1d/std(filtRefVar1d);
filtRefVar3d        = zeros(numLat,numLon,length(filtRefVar1d));
filtRefVar3d(1,1,:) = filtRefVar1d;
filtRefVar3d        = repmat(filtRefVar3d(1,1,:),[numLon numLat 1]);

%
for k = 1:size(vcomp, 3)
selectSigma = k;
var1  = squeeze(ucomp(:,:,selectSigma,:));
corr1 = mean(var1.*filtRefVar3d,3);

var2  = squeeze(vcomp(:,:,selectSigma,:));
corr2 = mean(var2.*filtRefVar3d,3);

%var3  = squeeze(omega(:,:,selectSigma,:));
%corr3 = mean(var3.*filtRefVar3d,3);

u3d(:,:,k) = corr1;
v3d(:,:,k) = corr2;
%w3d(:,:,k) = corr3;
end
figure
imagesc(squeeze(mean(u3d.*v3d, 1))')
%% plot velocity fields
lon = ncread(fileID, 'lon');
lat = ncread(fileID, 'lat');

x = 1:10:numLon; y = 1:3:numLat;
bt_u = mean(u3d, 3); bt_v = mean(v3d, 3);
figure()
quiver(lon(x),lat(y), bt_u(x,y)',bt_v(x,y)');
title('barotropic')
xlim([0 360]); ylim([55 80])
%%
x = 1:3:numLon; y = 1:2:numLat;
refLevel = 10;
d = 20;
bc_u = u3d(:,:,refLevel) - u3d(:,:,refLevel+d);
bc_v = v3d(:,:,refLevel) - v3d(:,:,refLevel+d);
figure
quiver(lon(x),lat(y),bc_u(x,y)',bc_v(x,y)', 2)
title('baroclinic')
xlim([0 360]); ylim([-90 90])
%%
imagesc(lon,lat,squeeze(w3d(:,:,5))')