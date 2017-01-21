% contour RossbyR(dely,gamma)
% contour eddyScaleFullGCM(dely,gamma)

%------------------------size of figure------------------------------------
figureHeight = 3.5; % unit inches
width2height= 2.2;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);
fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);

p = panel(figure1);
p.pack(1, 2);

p(1, 1).select();
%subplot(1,2,1)
x_gamma = [0.1 0.2 0.5 1 2 5 10 20 40];
y_dely  = [30 60 90 120];

contourf(x_gamma,y_dely,RossbyR_earthLike'/1000)
colorbar
set(gca,...
    'YTickLabel',{'30','','','60','','','90','','','120'},...
    'YTick',[30 40 50 60 70 80 90 100 110 120],...
    'YScale','log',...
    'YMinorTick','on',...
    'XTickLabel',{'0.1','','','','','','','','','','10','','','40'},...
    'XTick',[0.1 1 2 3 4 5 6 7 8 9 10 20 30 40],...
    'XScale','log',...
    'XMinorTick','on',...
    'TickLength',[0.015 0.01],...
    'PlotBoxAspectRatio',[1 1 1],...
    'LineWidth',1,...
    'Layer','top',...
    'FontSize',16);
box(gca,'on')
axis square

set(gca,'fontsize',16,'linewidth',1)
set(gca,'TickLength',[0.015 0.01]);

xlabel({'\gamma'},      'FontSize',16,'FontWeight','bold');
ylabel({'\delta_y (K)'},'FontSize',16,'FontWeight','bold');
title('L_R (10^3 km)',  'FontSize',16,'FontWeight','bold');

% --------------------- contour eddy scale --------------------------------

p(1, 2).select();
%subplot(1,2,2)
x_gamma = [0.1 0.2 0.5 1 2 5 10 20 40];
y_dely  = [30 60 90 120];

contourf(x_gamma,y_dely,eddyScaleFullGCM_earthLike'/1000)
colorbar
set(gca,...
    'YTickLabel',{'','','','','','','','','',''},...
    'YTick',[30 40 50 60 70 80 90 100 110 120],...
    'YScale','log',...
    'YMinorTick','on',...
    'XTickLabel',{'0.1','','','','','','','','','','10','','','40'},...
    'XTick',[0.1 1 2 3 4 5 6 7 8 9 10 20 30 40],...
    'XScale','log',...
    'XMinorTick','on',...
    'TickLength',[0.015 0.01],...
    'PlotBoxAspectRatio',[1 1 1],...
    'LineWidth',1,...
    'Layer','top',...
    'FontSize',16);
box(gca,'on')
axis square

set(gca,'fontsize',16,'linewidth',1)
set(gca,'XScale','log','YScale','log')
set(gca,'TickLength',[0.015 0.01]);

xlabel({'\gamma'},      'FontSize',16,'FontWeight','bold');
title('L_e (10^3 km)',  'FontSize',16,'FontWeight','bold');