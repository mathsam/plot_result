%% plot the ensemble experiments: ES_fullGCM/ES_fullGCM(4) vs. gamma
% run these first
% expNum = 1; ES_fullGCM = zeros(6,9);
gamma = [0.1 0.2 0.5 1 2 5 10 20 40];
ES_fullGCM(expNum,:) = EddyScale_fullGCM/EddyScale_fullGCM(4);
expNum = expNum+1;
%%
colorScheme = {'bo','rs','gd','m^','ch','k*'};
colorMarker = 'brgmck';
for expNum = 1:size(ES_fullGCM,1)
    plot(gamma,ES_fullGCM(expNum,:),['--' char(colorScheme{expNum})],...
    'linewidth',1,'markeredgecolor',colorMarker(expNum),'MarkerFaceColor',colorMarker(expNum),...
    'markersize',4);
hold on
end

aveES_fullGCM = plot_ensemble(gamma,ES_fullGCM);
alpha(0.3);
plot(gamma,aveES_fullGCM,'k','linewidth',3)
set(gca,'fontsize',16)
xlabel('\gamma','fontsize',16)
ylabel('Eddy Scale, ratio about \gamma=1','fontsize',16)
axis square
xlim([0.1 40])