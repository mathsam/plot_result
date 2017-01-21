%% plot the ensemble experiments: Sc/Sc(4) vs. gamma
% run these first
% expNum = 1; Sc = zeros(6,9);
%gamma = [0.1 0.2 0.5 1 2 5 10 20 40];
%Sc(expNum,:) = Sc_fullGCM/Sc_fullGCM(4);
%expNum = expNum+1;

colorScheme = {'bo','rs','gd','m^','ch','k*'};
colorMarker = 'brgmck';
for expNum = 1:size(Sc,1)
    plot(gamma,Sc(expNum,:),['--' char(colorScheme{expNum})],...
    'linewidth',1,'markeredgecolor',colorMarker(expNum),'MarkerFaceColor',colorMarker(expNum),...
    'markersize',4);
hold on
end

aveSc = plot_ensemble(gamma,Sc);
alpha(0.3);
plot(gamma,aveSc,'k','linewidth',3)
set(gca,'fontsize',16)
xlabel('\gamma','fontsize',16)
ylabel('Sc, ratio about \gamma=1','fontsize',16)
axis square