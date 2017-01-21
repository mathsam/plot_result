figureHeight = 10; % unit inches
figureWidth= 7;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
ha = tight_subplot(3,2,[0.07, 0.1],[0.08 0.05],[0.1 0.02]);

fontsize1 = 12;
fontsize2 = 9;
linesize1 = 1.5;
linesize2 = 0.75;

Ps = 1e5;
G  = 9.8;
rescale_factor = Ps/G; %convert unit from m^2/s^3 into W/m^2

axes(ha(1))

load('/home/j1c/analysis/2014/Apr23/kfe0/EKEBudget/Apr23_kfe0_seg_ave15.mat')
plot(k,rescale_factor*k.*eddyEddyGsApprox,'r','linewidth',linesize1); hold on
E_residual = eddyEddyGsApprox+transfer_woMean+Dissip+hyperD_EKE;
plot(k,rescale_factor*k.*eddyTransfer,'g','linewidth',linesize1);
plot(k,rescale_factor*k.*(transfer_woMean-eddyTransfer),'b','linewidth',linesize1);
plot(k,rescale_factor*k.*Dissip,'--k','linewidth',linesize1);
plot(k,rescale_factor*k.*hyperD_EKE,'k','linewidth',linesize1);
plot(k,rescale_factor*k.*E_residual,'--c','linewidth',linesize1);
h1 = legend('G_{EKE}','T_{EE}','T_{EM}',...
    '-D_{fri}','-D_{vis}','Residual');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','NorthWest','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');
ylabel('n{\cdot}dEKE_n/dt (W m^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])
%axis square


axes(ha(2))
plot(k,rescale_factor*k.*(totalVorAccel-totalTransfer+totalSurfC+totalVertAdvect),'r', 'linewidth', linesize1)
hold on;plot(k,rescale_factor*k.*totalTransfer,'b', 'linewidth', linesize1)
plot(k,rescale_factor*k.*totalDissip,'--k', 'linewidth', linesize1)
plot(k,rescale_factor*k.*hyperD_E,'k', 'linewidth', linesize1)
res = (totalVorAccel+totalSurfC+totalDissip+hyperD_E+totalVertAdvect);
plot(k,rescale_factor*k.*res,'--c', 'linewidth', linesize1)
xlim([1 length(k)])
ylabel('n{\cdot}dKE_n/dt (W m^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
set(gca,'fontsize',fontsize1,'XScale','log');
h1 = legend('G_{KE}','T_{NL}','-D_{fri}',...
           '-D_{vis}','Residual');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','NorthEast','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
%axis square




axes(ha(3))
load('/home/j1c/analysis/2014/Apr23/kfe2/EKEBudget/Apr23_kfe2_seg_ave15.mat')

plot(k,rescale_factor*k.*eddyEddyGsApprox,'r','linewidth',linesize1); hold on
E_residual = eddyEddyGsApprox+transfer_woMean+Dissip+hyperD_EKE;
plot(k,rescale_factor*k.*eddyTransfer,'g','linewidth',linesize1);
plot(k,rescale_factor*k.*(transfer_woMean-eddyTransfer),'b','linewidth',linesize1);
plot(k,rescale_factor*k.*Dissip,'--k','linewidth',linesize1);
plot(k,rescale_factor*k.*hyperD_EKE,'k','linewidth',linesize1);
plot(k,rescale_factor*k.*E_residual,'--c','linewidth',linesize1);
set(gca,'fontsize',fontsize1,'XScale','log');
ylabel('n{\cdot}dEKE_n/dt (W m^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])
%axis square


axes(ha(4))
plot(k,rescale_factor*k.*(totalVorAccel-totalTransfer+totalSurfC+totalVertAdvect),'r', 'linewidth', linesize1)
hold on;plot(k,rescale_factor*k.*totalTransfer,'b', 'linewidth', linesize1)
plot(k,rescale_factor*k.*totalDissip,'--k', 'linewidth', linesize1)
plot(k,rescale_factor*k.*hyperD_E,'k', 'linewidth', linesize1)
res = (totalVorAccel+totalSurfC+totalDissip+hyperD_E+totalVertAdvect);
plot(k,rescale_factor*k.*res,'--c', 'linewidth', linesize1)
xlim([1 length(k)])
ylabel('n{\cdot}dKE_n/dt (W m^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
set(gca,'fontsize',fontsize1,'XScale','log');
%axis square



axes(ha(5))
load('/home/j1c/analysis/2014/Apr23/kfe4/EKEBudget/Apr23_kfe4_seg_ave30.mat')

plot(k,rescale_factor*k.*eddyEddyGsApprox,'r','linewidth',linesize1); hold on
E_residual = eddyEddyGsApprox+transfer_woMean+Dissip+hyperD_EKE;
plot(k,rescale_factor*k.*eddyTransfer,'g','linewidth',linesize1);
plot(k,rescale_factor*k.*(transfer_woMean-eddyTransfer),'b','linewidth',linesize1);
plot(k,rescale_factor*k.*Dissip,'--k','linewidth',linesize1);
plot(k,rescale_factor*k.*hyperD_EKE,'k','linewidth',linesize1);
plot(k,rescale_factor*k.*E_residual,'--c','linewidth',linesize1);
set(gca,'fontsize',fontsize1,'XScale','log');
ylabel('n{\cdot}dEKE_n/dt (W m^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlabel('wavenumber', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])
%axis square


axes(ha(6))
plot(k,rescale_factor*k.*(totalVorAccel-totalTransfer+totalSurfC+totalVertAdvect),'r', 'linewidth', linesize1)
hold on;plot(k,rescale_factor*k.*totalTransfer,'b', 'linewidth', linesize1)
plot(k,rescale_factor*k.*totalDissip,'--k', 'linewidth', linesize1)
plot(k,rescale_factor*k.*hyperD_E,'k', 'linewidth', linesize1)
res = (totalVorAccel+totalSurfC+totalDissip+hyperD_E+totalVertAdvect);
plot(k,rescale_factor*k.*res,'--c', 'linewidth', linesize1)
xlim([1 length(k)])
ylabel('n{\cdot}dKE_n/dt (W m^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlabel('wavenumber', 'fontsize', fontsize1, 'fontweight', 'bold')
set(gca,'fontsize',fontsize1,'XScale','log');
%axis square