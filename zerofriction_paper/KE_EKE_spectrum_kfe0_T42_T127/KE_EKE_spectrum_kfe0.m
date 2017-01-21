figureHeight = 3.5; % unit inches
figureWidth= 4.5;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 16;
fontsize2 = 14;
linesize1 = 1;
linesize2 = 1;

load('/home/j1c/analysis/2014/Apr23/kfe0/EKEBudget/Apr23_kfe0_seg_ave15.mat')
loglog(k, totalE,'b','linewidth',linesize1); hold on
load('/home/j1c/analysis/2014/Apr23_T127/kfe0/EKEBudget/Apr23_T127_kfe0_seg_ave15.mat')
loglog(k, totalE,'g','linewidth',linesize1); hold on

load('/home/j1c/analysis/2014/Apr23/kfe0/EKEBudget/Apr23_kfe0_seg_ave15.mat')
loglog(k, EKE,'--b','linewidth',linesize1); hold on
load('/home/j1c/analysis/2014/Apr23_T127/kfe0/EKEBudget/Apr23_T127_kfe0_seg_ave15.mat')
loglog(k, EKE,'--g','linewidth',linesize1); hold on


h1 = legend('T42 KE','T127 KE','T42 EKE','T127 EKE');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','Northeast','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');

ylabel('E_n (m^2s^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlabel('Wavenumber', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])
%ylim([1e-8, 1e2])
