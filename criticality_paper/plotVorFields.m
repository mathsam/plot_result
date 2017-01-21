filename   = 'Jun23_T511_seg7';
archiveDir = '/archive/j1c/';

startTime  = 1;
endTime    = 30;
pLevel     = 10;

vor = ncread([archiveDir filename '.nc'],'vor');

for t = startTime:endTime
    imagesc(reshape(vor(:,:,pLevel,t),size(vor,1),size(vor,2))');
    caxis([-1e-4 1e-4])
    colorbar
    print('-dpng',[filename 't=' num2str(t) '.png']);
end
