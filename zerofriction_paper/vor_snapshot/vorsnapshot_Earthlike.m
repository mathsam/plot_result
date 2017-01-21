figureHeight = 3.5*2; % unit inches
width2height= 1/1.7;

fig = figure('unit','inches','position',...
                [0 0 figureHeight*width2height figureHeight]);
ha = tight_subplot(2,1,0.01,[0.02 0.05],[0.02 0.1]) ;

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 11;
fontsize2 = 10;
markersize1 = 2;
linewidth = 0.7;
tagFontsize  = 10;
axisFontsize = 12;

axes(ha(1))

archiveDir = '/arch5/j1c/sigmaCoord/2014/Apr23_kfe0/';
filename   = [archiveDir 'Apr23_kfe0_seg15.nc'];
vor = ncread(filename, 'vor');
lat = ncread(filename, 'lat');
lon = ncread(filename, 'lon');
pLevel = 10;
%
C = double(vor(:,:,pLevel, end))';
C(:,129) = C(:,1);
lon(129) = lon(128)*2 - lon(127);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat, lon, C, 30);
minColorRange = min(C(:))*0.8;
maxColorRange = max(C(:))*0.8;
colormap(b2r(minColorRange,maxColorRange))
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])

axes(ha(2))

archiveDir = '/arch5/j1c/sigmaCoord/2014/Apr23_kfe3/';
filename   = [archiveDir 'Apr23_kfe3_seg15.nc'];
vor = ncread(filename, 'vor');
lat = ncread(filename, 'lat');
lon = ncread(filename, 'lon');
pLevel = 10;
%
C = double(vor(:,:,pLevel, end))';
C(:,129) = C(:,1);
lon(129) = lon(128)*2 - lon(127);
h=axesm('Mapprojection','stereo', 'frame', 'off', 'Grid','on','origin',[90 180 0],'MLabelParallel',0,'PLabelMeridian',0)
contourfm(lat, lon, C, 30);
minColorRange = min(C(:))*0.8;
maxColorRange = max(C(:))*0.8;
colormap(b2r(minColorRange,maxColorRange))
colorbar('fontsize', 15)
box off
set(gca, 'YColor', [1 1 1], 'Xcolor', [1 1 1])