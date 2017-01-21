%% plot the ensemble experiments: FluxHeightRatio_orig vs. gamma
% run these first
% expNum = 1; HeightRatio = zeros(6,9);
gamma = [0.1 0.2 0.5 1 2 5 10 20 40];
HeightRatio(expNum,:) = FluxHeightRatio_fullGCM_orig/FluxHeightRatio_fullGCM_orig(4);
expNum = expNum+1;
%%
colorScheme = {'bo','rs','gd','m^','ch','k*'};
colorMarker = 'brgmck';
for expNum = 1:size(HeightRatio,1)
    plot(gamma,HeightRatio(expNum,:),['--' char(colorScheme{expNum})],...
    'linewidth',1,'markeredgecolor',colorMarker(expNum),'MarkerFaceColor',colorMarker(expNum),...
    'markersize',4);
hold on
end

aveHeightRatio = plot_ensemble(gamma,HeightRatio);
alpha(0.3);
plot(gamma,aveHeightRatio,'k','linewidth',3)
set(gca,'fontsize',16)
xlabel('\gamma','fontsize',16)
ylabel('h/H, ratio about \gamma=1','fontsize',16)
axis square
xlim([0.1 40])