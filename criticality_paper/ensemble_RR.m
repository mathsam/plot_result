%% plot the ensemble experiments: RR/RR(4) vs. gamma
% run these first
% expNum = 1; RR = zeros(6,9);
%gamma = [0.1 0.2 0.5 1 2 5 10 20 40];
%RR(expNum,:) = RR_fullGCM/RR_fullGCM(4);
%expNum = expNum+1;

colorScheme = {'bo','rs','gd','m^','ch','k*'};
colorMarker = 'brgmck';
for expNum = 1:size(RR,1)
    plot(gamma,RR(expNum,:),['--' char(colorScheme{expNum})],...
    'linewidth',1,'markeredgecolor',colorMarker(expNum),'MarkerFaceColor',colorMarker(expNum),...
    'markersize',4);
hold on
end

aveRR = plot_ensemble(gamma,RR);
alpha(0.3);
plot(gamma,aveRR,'k','linewidth',3)
set(gca,'fontsize',16)
xlabel('\gamma','fontsize',16)
ylabel('Rossby Radius, ratio about \gamma=1','fontsize',16)
axis square
xlim([0.1 40])