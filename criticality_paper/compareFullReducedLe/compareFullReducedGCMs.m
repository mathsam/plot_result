% compare the eddy scale in full and reduced GCMs

figureHeight = 3.5; % unit inches
width2height= 1.05;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 12;
fontsize2 = 10;
markersize1 = 2;

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--k','linewidth',2)
hold on

h1 = plot(eddyScaleReducedGCM_earthLike,eddyScaleFullGCM_earthLike,'--bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(eddyScaleReducedGCM_2omega,eddyScaleFullGCM_2omega,'--rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(eddyScaleReducedGCM_2radius,eddyScaleFullGCM_2radius,'--m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(eddyScaleReducedGCM_4omega,eddyScaleFullGCM_4omega,'--gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);
h5 = plot(eddyScaleReducedGCM_4radius,eddyScaleFullGCM_4radius,'--k*',...
    'linewidth',1,'markeredgecolor','k','MarkerFaceColor','k',...
    'markersize',markersize1);
set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02])
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([400 5000])
ylim([400 5000])

set(gca,'XTickLabel',{'','500','','','','','1,000','2,000','','','5,000'},...
    'XTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000],...
    'YTickLabel',{'','500','','','','','1,000','2,000','','','5,000'},...
    'YTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000])

xlabel({'L_e in reduced GCM (km)'},'FontSize',fontsize1,'FontWeight','bold');
ylabel({'L_e in full GCM (km)'},'FontSize',fontsize1,'FontWeight','bold');

legend1 = legend([h1(1) h2(1) h3(1) h4(1) h5(1)],'Earth-like','2\Omega_e','2a_e','4\Omega_e','4a_e');
set(legend1,'fontsize',fontsize2,'box','off','location','northwest')