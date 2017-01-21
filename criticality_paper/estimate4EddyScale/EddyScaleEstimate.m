% compare the shallow wave estimate for eddy scale

figureHeight = 3.5*2; % unit inches
width2height= 2.0;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 12;
fontsize2 = 10;
markersize1 = 2;

fittingC = 1.777;
C = 8.722;
A = 0.362;

ha = tight_subplot(2,2,0.02,[0.18 0.1],[0.1 0.02]) ;
% =========================== shallow wave estimate ======================
axes(ha(1))

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--','linewidth',2,'color',[0.5 0.5 0.5])
hold on

h1 = plot(fittingC*delH_earthLike./delV_earthLike.*RossbyR_earthLike,eddyScaleFullGCM_earthLike,':bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(fittingC*delH_2omega./delV_2omega.*RossbyR_2omega,eddyScaleFullGCM_2omega,':rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(fittingC*delH_2radius./delV_2radius.*RossbyR_2radius,eddyScaleFullGCM_2radius,':m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(fittingC*delH_4omega./delV_4omega.*RossbyR_4omega,eddyScaleFullGCM_4omega,':gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);
h5 = plot(fittingC*delH_4radius./delV_4radius.*RossbyR_4radius,eddyScaleFullGCM_4radius,':k*',...
    'linewidth',1,'markeredgecolor','k','MarkerFaceColor','k',...
    'markersize',markersize1);
set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02])
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([300 10000])
ylim([300 10000])

set(gca,'XTickLabel',{'','500','','','','','1,000','2,000','','','5,000'},...
    'XTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000],...
    'YTickLabel',{'','500','','','','','1,000','2,000','','','5,000'},...
    'YTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000])

xlabel({'C\xiL_R (km)'},'FontSize',fontsize1,'FontWeight','bold');
ylabel({'L_R (km)'},'FontSize',fontsize1,'FontWeight','bold');

legend1 = legend([h1(1) h2(1) h3(1) h4(1) h5(1)],'Earth-like','2\Omega_e','2a_e','4\Omega_e','4a_e');
set(legend1,'fontsize',fontsize2,'box','off','location','northwest')



% =========================== Charney wave estimate ======================
axes(ha(2))

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--','linewidth',2,'color',[0.5 0.5 0.5])
hold on

h1 = plot(myEstimate(delH_earthLike./delV_earthLike,RossbyR_earthLike,C,A),eddyScaleFullGCM_earthLike,':bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(myEstimate(delH_2omega./delV_2omega,RossbyR_2omega,C,A),eddyScaleFullGCM_2omega,':rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(myEstimate(delH_2radius./delV_2radius,RossbyR_2radius,C,A),eddyScaleFullGCM_2radius,':m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(myEstimate(delH_4omega./delV_4omega,RossbyR_4omega,C,A),eddyScaleFullGCM_4omega,':gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);
h5 = plot(myEstimate(delH_4radius./delV_4radius,RossbyR_4radius,C,A),eddyScaleFullGCM_4radius,':k*',...
    'linewidth',1,'markeredgecolor','k','MarkerFaceColor','k',...
    'markersize',markersize1);
set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02])
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([300 10000])
ylim([300 10000])

set(gca,'XTickLabel',{'','500','','','','','1,000','2,000','','','5,000'},...
    'XTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000],...
    'YTickLabel',{'','','','','','','','','','',''},...
    'YTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000])

xlabel({'CA\xi/(A\xi+1)L_R (km)'},'FontSize',fontsize1,'FontWeight','bold');

legend1 = legend([h1(1) h2(1) h3(1) h4(1) h5(1)],'Earth-like','2\Omega_e','2a_e','4\Omega_e','4a_e');
set(legend1,'fontsize',fontsize2,'box','off','location','northwest')


% =========================== Charney wave estimate: separete A C=========
axes(ha(3))

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--','linewidth',2,'color',[0.5 0.5 0.5])
hold on

h1 = plot(myEstimate(delH_earthLike./delV_earthLike,RossbyR_earthLike,6.93,0.5204),eddyScaleFullGCM_earthLike,':bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(myEstimate(delH_2omega./delV_2omega,RossbyR_2omega,13.9919,0.2814),eddyScaleFullGCM_2omega,':rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(myEstimate(delH_2radius./delV_2radius,RossbyR_2radius,10.3627,0.3322),eddyScaleFullGCM_2radius,':m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(myEstimate(delH_4omega./delV_4omega,RossbyR_4omega,22.6603,0.1864),eddyScaleFullGCM_4omega,':gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);
h5 = plot(myEstimate(delH_4radius./delV_4radius,RossbyR_4radius,8.8574,0.4058),eddyScaleFullGCM_4radius,':k*',...
    'linewidth',1,'markeredgecolor','k','MarkerFaceColor','k',...
    'markersize',markersize1);
set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02])
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([300 10000])
ylim([300 10000])

set(gca,'XTickLabel',{'','500','','','','','1,000','2,000','','','5,000'},...
    'XTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000],...
    'YTickLabel',{'','500','','','','','1,000','2,000','','','5,000'},...
    'YTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000])

xlabel({'CA\xi/(A\xi+1)L_R (km)'},'FontSize',fontsize1,'FontWeight','bold');

legend1 = legend([h1(1) h2(1) h3(1) h4(1) h5(1)],'Earth-like','2\Omega_e','2a_e','4\Omega_e','4a_e');
set(legend1,'fontsize',fontsize2,'box','off','location','northwest')