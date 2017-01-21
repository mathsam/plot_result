% plot the 1d PTflux vs. pressure

figureHeight = 3.5; % unit inches
width2height= 2.1;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);


fontsize1  = 12;

yTick      = [200  400  600 800];
yTickLabel = {'200','400','600','800'};


ha = tight_subplot(1,2,0.1,[0.2 0.05],[0.15 0.02]) ;
axes(ha(1))

refPre = round(30*0.7)+1;
plot([0.5 1],[pfull(refPre-4) pfull(refPre-4)],'--k','linewidth',1)
hold on
plot([0.5 1],[pfull(refPre+3) pfull(refPre+3)],'--k','linewidth',1)

h1 = loglog(pTfluxAve_gamma01/max(pTfluxAve_gamma01),pfull,'g','linewidth',2);
hold on
h2 = loglog(pTfluxAve_gamma1/max(pTfluxAve_gamma1),pfull,'b','linewidth',2);
h3 = loglog(pTfluxAve_gamma10/max(pTfluxAve_gamma10),pfull,'r','linewidth',2);

xlabel({'$\overline{v''{\theta}''}/\max{\overline{v''{\theta}''}}$'},...
    'Interpreter','latex',...
    'FontSize',fontsize1,'position',[0.315 1020 1],'FontWeight','bold');
ylabel('Pressure (mb)','fontsize',fontsize1,'FontWeight','bold')
xlim([5*1e-2 1])
set(gca,'fontsize',fontsize1,'linewidth',1,'YDir','reverse')
set(gca,'ytick',yTick,'yticklabel',yTickLabel)
axis square
ylim([300 1000])

legendh1 = legend([h1 h2 h3],{'{\gamma}=0.1';'{\gamma}=1';'{\gamma}=10'},'fontsize',fontsize1);
set(legendh1,'fontsize',fontsize1,'box','off','Location','SouthWest')



% ----------------- plot waveheigth for delh=60K --------------------------
axes(ha(2))
x_gamma    = [0.1 0.2 0.5 1 2 5 10 20 40];
markersize1 = 4;
semilogx(x_gamma,waveHeight(:,1),'--bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
semilogx(x_gamma,waveHeight(:,2),'--rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
semilogx(x_gamma,waveHeight(:,3),'--m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
semilogx(x_gamma,waveHeight(:,4),'--gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);
legend1 = legend('30 K','60 K','90 K','120 K');
set(legend1,'fontsize',fontsize1,'box','off','location','northwest')
box on
set(gca,'YTickLabel',{'0.5','1','1.5','2'},...
    'YTick',[0.5 1 1.5 2],...
    'XTickLabel',{'0.1','1','','','','','','','','','10','','','40'},...
    'XTick',[0.1 1 2 3 4 5 6 7 8 9 10 20 30 40],...
    'XScale','log',...
    'XMinorTick','on');
axis square
set(gca,'fontsize',fontsize1,'linewidth',1)
xlabel('\gamma','fontsize',fontsize1,'fontweight','bold');
ylabel('h_\theta/H_\rho','fontsize',fontsize1,'fontweight','bold')

