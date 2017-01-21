% compare L_e with Rossby radius and RhinesScale

%------------------------size of figure------------------------------------
figureHeight = 3.5; % unit inches
width2height= 2.0;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 12;
fontsize2 = 10;
markersize1 = 3;

LR_fitCoeff = 3.539;
Lbeta_fitCoeff = 2.69;

ha = tight_subplot(1,2,0.02,[0.18 0.1],[0.1 0.02]) ;

% ==================== plot RossbyR vs L_e first ==========================
axes(ha(1))

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--k','linewidth',2)
hold on

h1 = plot(LR_fitCoeff*RossbyR_earthLike,eddyScaleFullGCM_earthLike,'--bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(LR_fitCoeff*RossbyR_2omega,eddyScaleFullGCM_2omega,'--rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(LR_fitCoeff*RossbyR_2radius,eddyScaleFullGCM_2radius,'--m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(LR_fitCoeff*RossbyR_4omega,eddyScaleFullGCM_4omega,'--gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);
h5 = plot(LR_fitCoeff*RossbyR_4radius,eddyScaleFullGCM_4radius,'--k*',...
    'linewidth',1,'markeredgecolor','k','MarkerFaceColor','k',...
    'markersize',markersize1);
set(gca,'fontsize',fontsize1,'linewidth',1)
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([300 10000])
ylim([300 10000])

xlabel({'3.5{\times}L_R (km)'},'FontSize',fontsize1,'FontWeight','bold');
ylabel({'L_e (km)'},'FontSize',fontsize1,'FontWeight','bold');

% ==================== plot RhinesScale vs L_e second=====================
axes(ha(2))

refX  = 100:100:10000;
refY  = refX;
plot(refX,refY,'--k','linewidth',2)
hold on

h1 = plot(Lbeta_fitCoeff*RhinesScale_earthLike,eddyScaleFullGCM_earthLike,'--bo',...
    'linewidth',1,'markeredgecolor','b','MarkerFaceColor','b',...
    'markersize',markersize1);
hold on
h2 = plot(Lbeta_fitCoeff*RhinesScale_2omega,eddyScaleFullGCM_2omega,'--rs',...
    'linewidth',1,'markeredgecolor','r','MarkerFaceColor','r',...
    'markersize',markersize1);
h3 = plot(Lbeta_fitCoeff*RhinesScale_2radius,eddyScaleFullGCM_2radius,'--m^',...
    'linewidth',1,'markeredgecolor','m','MarkerFaceColor','m',...
    'markersize',markersize1);
h4 = plot(Lbeta_fitCoeff*RhinesScale_4omega,eddyScaleFullGCM_4omega,'--gd',...
    'linewidth',1,'markeredgecolor','g','MarkerFaceColor','g',...
    'markersize',markersize1);
h5 = plot(Lbeta_fitCoeff*RhinesScale_4radius,eddyScaleFullGCM_4radius,'--k*',...
    'linewidth',1,'markeredgecolor','k','MarkerFaceColor','k',...
    'markersize',markersize1);
set(gca,'fontsize',fontsize1,'linewidth',1)
set(gca,'XScale','log','YScale','log')
axis square
box on
xlim([300 10000])
ylim([300 10000])

xlabel({'2.7{\times}L_\beta (km)'},'FontSize',fontsize1,'FontWeight','bold');
%ylabel({'L_e (km)'},'FontSize',fontsize1,'FontWeight','bold');

legend1 = legend([h1(1) h2(1) h3(1) h4(1) h5(1)],'Earth-like','2\Omega_e','2a_e','4\Omega_e','4a_e');
set(legend1,'fontsize',fontsize2,'box','off','location','northwest')