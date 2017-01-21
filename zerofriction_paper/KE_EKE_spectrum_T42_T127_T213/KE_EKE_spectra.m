figureHeight = 5; % unit inches
figureWidth= 7;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
ha = tight_subplot(1,2,[0.1, 0.12],[0.15 0.05],[0.12 0.02]);

fontsize1 = 16;
fontsize2 = 14;
linesize1 = 1;
linesize2 = 1;

axes(ha(1))

load('/home/j1c/analysis/2014/Apr23/kfe3/EKEBudget/Apr23_kfe3_seg_ave15.mat')
loglog(k, totalE,'b','linewidth',linesize1); hold on
load('/home/j1c/analysis/2014/Apr23_T127/kfe3/EKEBudget/Apr23_T127_kfe3_seg_ave15.mat')
loglog(k, totalE,'g','linewidth',linesize1); hold on
load('/home/j1c/analysis/2016/Jan20/T213_kfe3/EKEBudget/Jan20_T213_kfe3_seg_ave20.mat')
loglog(k, totalE,'r','linewidth',linesize1); hold on

h1 = legend('T42','T127','T213');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','Northeast','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');

ylabel('E_n (m^2s^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])
%ylim([1e-8, 1e2])


axes(ha(2))

load('/home/j1c/analysis/2014/Apr23/kfe3/EKEBudget/Apr23_kfe3_seg_ave15.mat')
loglog(k, EKE,'b','linewidth',linesize1); hold on
load('/home/j1c/analysis/2014/Apr23_T127/kfe3/EKEBudget/Apr23_T127_kfe3_seg_ave15.mat')
loglog(k, EKE,'g','linewidth',linesize1); hold on
load('/home/j1c/analysis/2016/Jan20/T213_kfe3/EKEBudget/Jan20_T213_kfe3_seg_ave20.mat')
loglog(k, EKE,'r','linewidth',linesize1); hold on

h1 = legend('T42','T127','T213');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','Northeast','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');

ylabel('EKE_n (m^2s^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])

hold on
annotation(figure1,'textbox',...
    [0.445444444444444 0.0177777777777778 0.222809523809524 0.0622222222222222],...
    'String',{'Wavenumber'},...
    'FontWeight','bold',...
    'FitBoxToText','off',...
    'LineStyle','none');