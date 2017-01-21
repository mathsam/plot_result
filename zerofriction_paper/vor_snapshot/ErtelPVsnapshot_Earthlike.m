figureHeight = 3.5*3; % unit inches
width2height= 1/1.7;

fig = figure('unit','inches','position',...
                [0 0 figureHeight*width2height figureHeight]);
ha = tight_subplot(3,1,0.04,[0.02 0.05],[0.02 0.1]) ;

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 11;
fontsize2 = 10;
markersize1 = 2;
linewidth = 0.7;
tagFontsize  = 10;
axisFontsize = 12;

axes(ha(1))
load('/home/j1c/analysis/2014/Apr23/ErtelPV/kfe0/ErtelPV_PT=330K.mat')
C = ErtelPVxy';
C(:,129) = C(:,1);
lon(129) = lon(128)*2 - lon(127);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat(32:end), lon, C(32:end,:), 50);
%minColorRange = 0;
%maxColorRange = max(C(:))*0.8;
%colormap(b2r(minColorRange,maxColorRange))
caxis([0, 9e-6])
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])

axes(ha(2))

load('/home/j1c/analysis/2014/Apr23/ErtelPV/kfe3/ErtelPV_PT=330K.mat')
C = ErtelPVxy';
num_lon = length(lon);
num_lat = length(lat);
C(:,num_lon+1) = C(:,1);
lon(num_lon+1) = lon(end)*2 - lon(end-1);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat(num_lat/2:end), lon, C(num_lat/2:end,:), 50);
%minColorRange = 0;
%maxColorRange = max(C(:))*0.8;
%colormap(b2r(minColorRange,maxColorRange))
caxis([0, 1.1e-5])
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])

axes(ha(3))

load('/home/j1c/analysis/2014/Apr23/ErtelPV/kfe4/ErtelPV_PT=330K.mat')
C = ErtelPVxy';
num_lon = length(lon);
num_lat = length(lat);
C(:,num_lon+1) = C(:,1);
lon(num_lon+1) = lon(end)*2 - lon(end-1);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat(num_lat/2:end), lon, C(num_lat/2:end,:), 50);
%minColorRange = 0;
%maxColorRange = max(C(:))*0.8;
%colormap(b2r(minColorRange,maxColorRange))
caxis([0, 1.1e-5])
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])