% for criticality paper; compare EKE spectrum in full and reduced GCM

figureHeight = 3.5; % unit inches
width2height= 1.05;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 12;
fontsize2 = 11;

% =============== gamma = 0.1 =============================================
h1 = loglog(wavenumber,Ebt_mod1,'g','linewidth',1.5);

box  on
hold on
line([kbt_mod1 kbt_mod1],[max(Ebt_mod1)/4 max(Ebt_mod1)*3],...
      'color','black',...
      'linewidth',1)

loglog(wavenumber,Ebt_reduced_mod1,'--g','linewidth',1.5)


% =============== gamma = 1 =============================================
h2 = loglog(wavenumber,Ebt_mod4,'b','linewidth',1.5)

line([kbt_mod4 kbt_mod4],[max(Ebt_mod4)/4 max(Ebt_mod4)*3],...
      'color','black',...
      'linewidth',1)

loglog(wavenumber,Ebt_reduced_mod4,'--b','linewidth',1.5)

% =============== gamma = 40 =============================================
h3 = loglog(wavenumber,Ebt_mod7,'r','linewidth',1.5);

line([kbt_mod9 kbt_mod9],[max(Ebt_mod7)/4 max(Ebt_mod7)*3],...
      'color','black',...
      'linewidth',1)

loglog(wavenumber,Ebt_reduced_mod7,'--r','linewidth',1.5)


set(gca,'linewidth',1,'TickLength',[0.02 0.02])

axis square

x = 8:40;
plot(x,5*10e3./x.^3,'k','linewidth',2)
ylim([1e-7 5e2])
set(gca,'fontsize',fontsize1)
xlabel('Wavenumber','fontsize',fontsize1,'FontWeight','bold')
ylabel('EKE spectrum (m^2 s^{-2})','fontsize',fontsize1,'FontWeight','bold')

legend1 = legend([h1 h2 h3],'\gamma=0.1','\gamma=1','\gamma=10');
set(legend1,'fontsize',fontsize2,'box','off')

set(legend1,...
    'Position',[0.434583333333333 0.244775132275132 0.268181818181818 0.229365079365079],...
    'FontSize',fontsize2);

% Create textbox
annotation(gcf,'textbox',...
    [0.640393939393939 0.793650793650794 0.153545454545455 0.0698412698412698],...
    'String',{'k^{-3}'},...
    'FontSize',12,...
    'FitBoxToText','off',...
    'LineStyle','none');