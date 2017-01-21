filename   = 'Jun23_T511_seg_ave7';
archiveDir = '/archive/j1c/';

pLevel     = 10;

ucomp = ncread([archiveDir filename '.nc'],'ucomp');

    imagesc(reshape(ucomp(:,:,pLevel),size(ucomp,1),size(ucomp,2))');
    colorbar
    caxis([-70 70])
    print('-dpng',[filename '_ucomp' '.png']);
