% (2,1) subplots of wave vertical structure and scales
figureWidth = 3.5; % unit inches
width2height= 1/1.6;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureWidth/width2height]);
fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);

ha = tight_subplot(2,1,0.05,[0.1 0.01],[0.18 0.05]) ;

axes(ha(1));
plot(z,abs_psi,'--k','linewidth',2)
hold on
plot(z,PTFlux,'-k','linewidth',2)
plot(z,PVFlux,':k','linewidth',2)
xlim([0 4])
ylim([0 1])
%grid on
set(gca,'fontsize',12,'LineWidth',1,...
        'plotboxaspectratio',[4 3 1])
xlabel('z','fontsize',12,'fontweight','bold')
ylabel('Normalized values','fontsize',12,'fontweight','bold')
legend1 = legend('|\psi|','Heat flux','PV flux');
set(legend1,'fontsize',10,...
            'location','northeast',...
            'box','off')
        
% -------------- plot wave vertical scale vs. estimate --------------------
axes(ha(2));
plot(Sc,-1.074*exp(-0.5074*Sc)+1.096,'k','linewidth',2)
hold on
plot(Sc,1.09*Sc./(1+Sc),'--k','linewidth',2)
set(gca,'fontsize',12,'LineWidth',1,...
        'plotboxaspectratio',[4 3 1])
xlabel('Criticality','fontsize',12,'fontweight','bold')
ylabel('h_\theta','fontsize',12,'fontweight','bold')
legend1 = legend('Numerical','Scaling estimate');
set(legend1,'fontsize',10,...
            'location','southeast',...
            'box','off')