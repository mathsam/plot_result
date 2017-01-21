% contour of growthRate, a single plot
% waveVerticalStructure, comparison of wave vertical scale and estimate

%------------------------size of figure------------------------------------
figureWidth = 4; % unit inches
width2height= 4/3;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureWidth/width2height]);
fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);

plot(mostUnstableInvK,Sc_I,'k','linewidth',2)
hold on
plot(1.538*Sc_I./(Sc_I+1),Sc_I,'--k','linewidth',2)
legend1 = legend('Numerical','Scaling estimate');
set(legend1,'fontsize',10,...
            'location','southeast',...
            'box','off')
%contour(wavenumberSet_inv_I,Sc_I,growthRate2d_I,0.2:0.02:1,'linecolor',[0.5 0.5 0.5])
contourf(wavenumberSet_inv_I,Sc_I,growthRate2d_I,0.1:0.02:1,'linecolor','none')
colormap('hot');
colorbar
plot(mostUnstableInvK,Sc_I,'k','linewidth',2)
plot(1.538*Sc_I./(Sc_I+1),Sc_I,'--k','linewidth',2)
box on
%axis square
xlim([0.1 3]); ylim([0.1 4])
set(gca,'fontsize',12,'LineWidth',1,'plotboxaspectratio',[4 4 1])
xlabel('1/k','fontsize',12,'fontweight','bold')
ylabel('Criticality','fontsize',12,'fontweight','bold')


