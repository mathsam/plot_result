figureHeight = 3.5*3; % unit inches
width2height= 1/1.7;

fig = figure('unit','inches','position',...
                [0 0 figureHeight*width2height figureHeight]);
ha = tight_subplot(3,1,0.01,[0.02 0.05],[0.02 0.1]) ;

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 11;
fontsize2 = 10;
markersize1 = 2;
linewidth = 0.7;
tagFontsize  = 10;
axisFontsize = 12;

axes(ha(1))

archiveDir = '/arch5/j1c/sigmaCoord/2014/Feb28a_jupiter/';
filename   = [archiveDir 'Feb28a_jupiter_seg40.nc'];
vor = ncread(filename, 'ucomp');
lat = ncread(filename, 'lat');
lon = ncread(filename, 'lon');
pLevel = 4;
%
C = double(vor(:,:,pLevel, end))';
C(:,641) = C(:,1);
lon(641) = lon(640)*2 - lon(639);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','MapLatLimit',[30 90],'origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat(213:end), lon, C(213:end,:), 30);
minColorRange = min(reshape(C(213:end,:),1,[]))*0.8;
maxColorRange = max(reshape(C(213:end,:),1,[]))*0.9;
colormap(b2r(minColorRange,maxColorRange))
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])

axes(ha(2))

archiveDir = '/arch5/j1c/sigmaCoord/2014/Feb28b_jupiter/';
filename   = [archiveDir 'Feb28b_jupiter_seg40.nc'];
vor = ncread(filename, 'ucomp');
lat = ncread(filename, 'lat');
lon = ncread(filename, 'lon');
pLevel = 4;
%
C = double(vor(:,:,pLevel, end))';
C(:,641) = C(:,1);
lon(641) = lon(640)*2 - lon(639);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','MapLatLimit',[30 90],'origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat(213:end), lon, C(213:end,:), 30);
minColorRange = min(reshape(C(213:end,:),1,[]))*0.8;
maxColorRange = max(reshape(C(213:end,:),1,[]))*0.9;
colormap(b2r(minColorRange,maxColorRange))
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])

axes(ha(3))

archiveDir = '/arch5/j1c/sigmaCoord/2014/Feb28e_jupiter/';
filename   = [archiveDir 'Feb28e_jupiter_seg40.nc'];
vor = ncread(filename, 'ucomp');
lat = ncread(filename, 'lat');
lon = ncread(filename, 'lon');
pLevel = 4;
%
C = double(vor(:,:,pLevel, end))';
C(:,641) = C(:,1);
lon(641) = lon(640)*2 - lon(639);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','MapLatLimit',[30 90],'origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat(213:end), lon, C(213:end,:), 30);
minColorRange = min(reshape(C(213:end,:),1,[]))*0.8;
maxColorRange = max(reshape(C(213:end,:),1,[]))*0.9;
colormap(b2r(minColorRange,maxColorRange))
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])