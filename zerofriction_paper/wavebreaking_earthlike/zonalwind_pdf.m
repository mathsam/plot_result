pLevel = 10;
latRange = 1:1:64;
archiveDir = '/archive/Junyi.Chai/sigmaCoord/2014/Apr23_kfe3/';
files   = {[archiveDir 'Apr23_kfe3_seg10.nc'],...
           [archiveDir 'Apr23_kfe3_seg11.nc'],...
           [archiveDir 'Apr23_kfe3_seg12.nc'],...
           [archiveDir 'Apr23_kfe3_seg13.nc'],...
           [archiveDir 'Apr23_kfe3_seg14.nc'],...
           [archiveDir 'Apr23_kfe3_seg15.nc']};
ucomp = read_files(files,'ucomp',pLevel,latRange);
vcomp = read_files(files,'vcomp',pLevel,latRange);
lat   = ncread(files{1}, 'lat');
pfull = ncread(files{1},'pfull');

zonalmean_U = squeeze(mean(ucomp, 1));
zonal_time_mean_U = squeeze(mean(zonalmean_U,2));
zonalmean_U_std = squeeze(std(zonalmean_U,0,2));

%% eddy momentum flux
zonalmean_U_at_30 = squeeze(zonalmean_U(30,:));
eddy_u = bsxfun(@minus, ucomp, mean(ucomp,1));
eddy_v = bsxfun(@minus, vcomp, mean(vcomp,1));
extrema_index = zonalmean_U_at_30<-16;
uvflux_at_extrema = squeeze(mean(...
    mean(eddy_u(:,:,extrema_index).*eddy_v(:,:,extrema_index),1),3));
uvflux_at_regular = squeeze(mean(...
    mean(eddy_u(:,:,~extrema_index).*eddy_v(:,:,~extrema_index),1),3));