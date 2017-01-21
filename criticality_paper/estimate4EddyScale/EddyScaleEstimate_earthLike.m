% compare the shallow wave estimate for eddy scale

figureHeight = 3.5; % unit inches
width2height= 2.0;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 12;
fontsize2 = 10;
markersize1 = 4;

fittingC = 1.777;
C = 8.722;
A = 0.362;

ha = tight_subplot(1,2,0.04,[0.15 0.05],[0.1 0.02]) ;
% =========================== shallow wave estimate ======================
axes(ha(1))

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--','linewidth',2,'color',[0.5 0.5 0.5])
hold on

h1 = plot(fittingC*delH_earthLike(:,1)./delV_earthLike(:,1).*RossbyR_earthLike(:,1)...
          ,eddyScaleFullGCM_earthLike(:,1),':bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(fittingC*delH_earthLike(:,2)./delV_earthLike(:,2).*RossbyR_earthLike(:,2),...
           eddyScaleFullGCM_earthLike(:,2),':rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(fittingC*delH_earthLike(:,3)./delV_earthLike(:,3).*RossbyR_earthLike(:,3),...
           eddyScaleFullGCM_earthLike(:,3),':m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(fittingC*delH_earthLike(:,4)./delV_earthLike(:,4).*RossbyR_earthLike(:,4),...
           eddyScaleFullGCM_earthLike(:,4),':gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);

set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02])
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([1000 5000])
ylim([1000 5000])

set(gca,'XTickLabel',{'','500','','','','','1000','2000','','4000',''},...
    'XTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000],...
    'YTickLabel',{'','500','','','','','1000','2000','','4000',''},...
    'YTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000])

xlabel({'C\xiL_R (km)'},'FontSize',fontsize1,'FontWeight','bold');
ylabel({'L_e (km)'},'FontSize',fontsize1,'FontWeight','bold');





% =========================== Charney wave estimate ======================
axes(ha(2))

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--','linewidth',2,'color',[0.5 0.5 0.5])
hold on

h1 = plot(myEstimate(delH_earthLike(:,1)./delV_earthLike(:,1),RossbyR_earthLike(:,1),C,A),...
                     eddyScaleFullGCM_earthLike(:,1),':bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(myEstimate(delH_earthLike(:,2)./delV_earthLike(:,2),RossbyR_earthLike(:,2),C,A),...
                     eddyScaleFullGCM_earthLike(:,2),':rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(myEstimate(delH_earthLike(:,3)./delV_earthLike(:,3),RossbyR_earthLike(:,3),C,A),...
                     eddyScaleFullGCM_earthLike(:,3),':m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(myEstimate(delH_earthLike(:,4)./delV_earthLike(:,4),RossbyR_earthLike(:,4),C,A),...
                     eddyScaleFullGCM_earthLike(:,4),':gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);

set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02])
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([1000 5000])
ylim([1000 5000])

set(gca,'XTickLabel',{'','500','','','','','1000','2000','','4000',''},...
    'XTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000],...
    'YTickLabel',{'','','','','','','','','','',''},...
    'YTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000])

xlabel({'CA\xi/(A\xi+1)L_R (km)'},'FontSize',fontsize1,'FontWeight','bold');

legend1 = legend([h1(1) h2(1) h3(1) h4(1)],'30 K','60 K','90 K','120 K');
set(legend1,'fontsize',fontsize2,'box','off','location','northwest')


