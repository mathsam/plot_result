% compare the eddy scale in full and reduced GCMs

figureHeight = 3.5; % unit inches
width2height= 1.05;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 12;
fontsize2 = 10;
markersize1 = 2;

refX  = 100:100:5000;
refY  = refX;
plot(refX,refY,'--','linewidth',2,'color',[0.5 0.5 0.5])
hold on

%h1 = plot(eddyScaleReducedGCM_earthLike,eddyScaleFullGCM_earthLike,'--ko',...
%    'linewidth',1,'markeredgecolor','k','MarkerFaceColor','k',...
%    'markersize',markersize1);


set(gca,'fontsize',fontsize1,'linewidth',1,'TickLength',[0.02 0.02])
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([1000 4000])
ylim([1000 4000])

set(gca,'XTickLabel',{'','500','','','','','1,000','2,000','','4000','5,000'},...
    'XTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000],...
    'YTickLabel',{'','500','','','','','1,000','2,000','','4000','5,000'},...
    'YTick',[400 500 600 700 800 900 1000 2000 3000 4000 5000])

xlabel({'L_e in reduced GCM (km)'},'FontSize',fontsize1,'FontWeight','bold');
ylabel({'L_e in full GCM (km)'},'FontSize',fontsize1,'FontWeight','bold');