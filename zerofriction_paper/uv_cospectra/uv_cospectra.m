pLevel = 11;
ref_lat = 275;
archiveDir = '/archive/Junyi.Chai/sigmaCoord/2014/Feb28e_jupiter/';
files   = {[archiveDir 'Feb28e_jupiter_seg35.nc'],...
           [archiveDir 'Feb28e_jupiter_seg36.nc'],...
           [archiveDir 'Feb28e_jupiter_seg37.nc'],...
           [archiveDir 'Feb28e_jupiter_seg38.nc'],...
           [archiveDir 'Feb28e_jupiter_seg39.nc'],...
           [archiveDir 'Feb28e_jupiter_seg40.nc']};
vcomp = read_files(files,'vcomp',pLevel,ref_lat);
ucomp = read_files(files,'ucomp',pLevel,ref_lat);
lat   = ncread(files{1}, 'lat');
pfull = ncread(files{1},'pfull');

%%



NFFT_time= 100;
numLon = size(vcomp, 1);
numTime  = size(vcomp, 2);
dwindow  = 150;

Umean  = sum(ucomp,1)/numLon;
Umean2d= repmat(Umean,[numLon 1]);
uslice = ucomp-Umean2d;
Vmean  = sum(vcomp,1)/numLon;
Vmean2d= repmat(Vmean,[numLon 1]);
vslice = vcomp-Vmean2d;

[K_p K_n fre_lon omega K_combine] = spaceTimeCrossSpec(vslice,uslice,dwindow,NFFT_time);

omega = linspace(-pi, pi, 2*length(omega));

NORM_FACTOR = 3.1471e-05;
%%
K_cutoff = -Inf;
K_plot = K_combine;
K_plot(K_plot<K_cutoff) = NaN;
K_plot = K_plot*NORM_FACTOR*(2*pi/0.5);

figure('unit','inch','position',[0,0,6,4.5])
contourf(omega, fre_lon/fre_lon(2), K_plot, 'linecolor', 'k')
colormap('gray')
ylim([1, 10])
xlim([-pi, pi])
xtick0 = 4*pi*[-0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5];
xtick_label0 = {'-0.5','-0.4','-0.3','-0.2','-0.1','0','0.1','0.2','0.3','0.4','0.5'};
set(gca, 'XTick', xtick0, 'XTickLabel', xtick_label0, 'fontsize', 14);

xlabel('Frequency (day^{-1})', 'fontsize', 15, 'fontweight', 'bold');
ylabel('Wavenumber', 'fontsize', 15, 'fontweight', 'bold')
title('Period (day)', 'fontsize', 15, 'fontweight', 'bold')
colorbar()
ax1 = gca;
ax2=axes('Position',get(ax1,'Position'),...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none',...
           'XColor','k','YColor','k');
set(ax1,'Box','off');
set(ax2,'XLim',[-pi pi],'YLim',[1 10])
xtick = 4*pi./[-2, -4, -6, -8, -10, -20, -30, -60, 60, 30, 20, 10, 8, 6, 4, 2];
xtick_label = {'-2', '-4', '-6', '-8', '-10', '-20', '', '',...
    '', '', '20', '10', '8', '6', '4', '2'};
set(ax2, 'XTick', xtick, 'XTickLabel', xtick_label,...
    'YTick',[], 'YTickLabel', {}, 'fontsize', 14)


%%
archiveDir = '/arch5/j1c/sigmaCoord/2014/Apr23_kfe3/';
filename   = [archiveDir 'Apr23_kfe3_seg15.nc'];
vor = ncread(filename, 'vor');
lat = ncread(filename, 'lat');
lon = ncread(filename, 'lon');
pLevel = 10;
%%
C = double(vor(:,:,pLevel, end))';
C(:,129) = C(:,1);
lon(129) = lon(128)*2 - lon(127);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat, lon, C, 30);
maxColorRange = max(C(:));
colormap(b2r(-maxColorRange,maxColorRange))
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])