figureHeight = 6; % unit inches
figureWidth= 7/2;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
ha = tight_subplot(2,1,[0.1, 0.1],[0.1 0.05],[0.15 0.02]);

fontsize1 = 12;
fontsize2 = 9;
linesize1 = 1.5;
linesize2 = 0.75;

Ps = 3e5;
G  = 24.79;
rescale_factor = Ps/G; %convert unit from m^2/s^3 into W/m^2

axes(ha(1))

load('/home/j1c/analysis/2014/Feb28/a/EKEBudget/Feb28a_jupiter_seg_ave40.mat')

plot(k,k.*eddyEddyGsApprox,'r','linewidth',linesize1); hold on
E_residual = eddyEddyGsApprox+transfer_woMean+Dissip+hyperD_EKE;
plot(k,k.*eddyTransfer,'g','linewidth',linesize1);
plot(k,k.*(transfer_woMean-eddyTransfer),'b','linewidth',linesize1);
plot(k,k.*Dissip,'--k','linewidth',linesize1);
plot(k,k.*hyperD_EKE,'k','linewidth',linesize1);
plot(k,k.*E_residual,'--c','linewidth',linesize1);
h1 = legend('G_{EKE}','T_{EE}','T_{EM}',...
    '-D_{fri}','-D_{vis}','Residual');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','NorthWest','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');

ylabel('n{\cdot}dEKE_n/dt (m^2s^{-3})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])



axes(ha(2))

load('/home/j1c/analysis/2014/Feb28/e/EKEBudget/Feb28e_jupiter_seg_ave40.mat')

plot(k,k.*eddyEddyGsApprox,'r','linewidth',linesize1); hold on
E_residual = eddyEddyGsApprox+transfer_woMean+Dissip+hyperD_EKE;
plot(k,k.*eddyTransfer,'g','linewidth',linesize1);
plot(k,k.*(transfer_woMean-eddyTransfer),'b','linewidth',linesize1);
plot(k,k.*Dissip,'--k','linewidth',linesize1);
plot(k,k.*hyperD_EKE,'k','linewidth',linesize1);
plot(k,k.*E_residual,'--c','linewidth',linesize1);
h1 = legend('G_{EKE}','T_{EE}','T_{EM}',...
    '-D_{fri}','-D_{vis}','Residual');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','NorthWest','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');
xlabel('wavenumber', 'fontsize', fontsize1, 'fontweight', 'bold')
ylabel('n{\cdot}dEKE_n/dt (m^2s^{-3})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])