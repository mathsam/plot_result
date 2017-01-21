figureHeight = 5; % unit inches
figureWidth= 7;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
ha = tight_subplot(1,2,[0.1, 0.1],[0.15 0.05],[0.15 0.02]);

fontsize1 = 16;
fontsize2 = 14;
linesize1 = 1;
linesize2 = 1;

axes(ha(1))

load('/home/j1c/plotResults/zerofriction_paper/KE_EKE_spectrum_jupiter/Feb28a_seg25_40_KE_EKE_spectrum.mat')

loglog(k, EKE,'g','linewidth',linesize1); hold on
loglog(k, totalE-EKE, 'k', 'linewidth', linesize1);
x = 10:80;
loglog(x, x.^(-5)*1e5, '--', 'linewidth', linesize1, 'color', [0.5, 0.5, 0.5]);

x = 50:150;
loglog(x, x.^(-5/3)*1e2, '--', 'linewidth', linesize1, 'color', [0.5, 0.5, 0.5]);
h1 = legend('EKE','ZKE');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','Southeast','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');

ylabel('E_n (m^2s^{-2})', 'fontsize', fontsize1, 'fontweight', 'bold')
xlim([1 length(k)])
ylim([1e-8, 1e2])


axes(ha(2))

load('/home/j1c/plotResults/zerofriction_paper/KE_EKE_spectrum_jupiter/Feb28d_seg25_40_KE_EKE_spectrum.mat')

loglog(k, EKE,'g','linewidth',linesize1); hold on
loglog(k, totalE-EKE, 'k', 'linewidth', linesize1);
x = 10:80;
loglog(x, x.^(-5)*1e5, '--', 'linewidth', linesize1, 'color', [0.5, 0.5, 0.5]);

x = 50:150;
loglog(x, x.^(-5/3)*1e2, '--', 'linewidth', linesize1, 'color', [0.5, 0.5, 0.5]);
h1 = legend('EKE','ZKE');
set(h1,'fontsize',fontsize2,'EdgeColor',[1 1 1],'Location','Southeast','YColor',[1 1 1],...
    'XColor',[1 1 1], 'color', 'none');
set(gca,'fontsize',fontsize1,'XScale','log');
xlim([1 length(k)])
ylim([1e-8, 1e2])

%
% Create textbox
hold on
annotation(figure1,'textbox',...
    [0.445444444444444 0.0177777777777778 0.222809523809524 0.0622222222222222],...
    'String',{'wavenumber'},...
    'FontWeight','bold',...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.446396825396826 0.695555555555556 0.0736031746031746 0.068888888888889],...
    'String',{'n^{-5/3}'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.442269841269841 0.364444444444445 0.0736031746031746 0.068888888888889],...
    'String',{'n^{-5}'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.894015873015872 0.371111111111111 0.0736031746031746 0.068888888888889],...
    'String',{'n^{-5}'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.894968253968254 0.631111111111112 0.0736031746031746 0.068888888888889],...
    'String',{'n^{-5/3}'},...
    'FitBoxToText','off',...
    'LineStyle','none');