% plot the spectral EKE budget
%------------------------size of figure------------------------------------
figureHeight = 3.5; % unit inches
width2height= 2.0;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
ha = tight_subplot(1,2,0.1,[0.15 0.15],[0.1 0.02]) ;
fontsize1 = 12;
fontsize2 = 10;
linesize1 = 1.5;
linesize2 = 0.75;

axes(ha(1))
plot(k,eddyEddyGs,'r','linewidth',linesize1); hold on
plot(k,eddyTransfer,'g','linewidth',linesize1);
plot(k,transfer_woMean-eddyTransfer,'b','linewidth',linesize1);
plot(k,Dissip,'--k','linewidth',linesize1);
plot(k,-(eddyEddyGs+transfer_woMean+Dissip),'--c','linewidth',linesize1)

h1 = legend('G','T_{EE}','T_{EM}','-D','Resi');
set(h1,'fontsize',fontsize1,'box','off','location','northeast','fontweight','bold');
set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02]);
xlim([1 42])
ylim([-2e-5 3e-5])
xlabel('Wavenumber','fontsize',fontsize1,'fontweight','bold')
ylabel('dEKE_n/dt (m^2 s^{-3})','fontsize',fontsize1,'fontweight','bold')
axis square

axes(ha(2))
plot(k,eddyEddyGs_gamma01,'g','linewidth',linesize1)
hold on
plot(k,eddyEddyGs_gamma1, 'b','linewidth',linesize1)
plot(k,eddyEddyGs_gamma10,'r','linewidth',linesize1)
barL = 1e-5;
plot([gK_gamma01 gK_gamma01],[max(eddyEddyGs_gamma01)-barL max(eddyEddyGs_gamma01)+barL],...
      'k','linewidth',linesize2)
plot([gK_gamma1 gK_gamma1],[max(eddyEddyGs_gamma1)-barL max(eddyEddyGs_gamma1)+barL],...
      'k','linewidth',linesize2)
plot([gK_gamma10 gK_gamma10],[max(eddyEddyGs_gamma10)-barL max(eddyEddyGs_gamma10)+barL],...
      'k','linewidth',linesize2)
h2 = legend('\gamma=0.1','\gamma=1','\gamma=10');
set(h2,'fontsize',fontsize1,'box','off','location','northeast','fontweight','bold');
set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02]);
xlabel('Wavenumber','fontsize',fontsize1,'fontweight','bold')
xlim([1 42])
ylim([0 12e-5])
axis square
ylabel('EKE generation (m^2 s^{-3})','fontsize',fontsize1,'fontweight','bold')