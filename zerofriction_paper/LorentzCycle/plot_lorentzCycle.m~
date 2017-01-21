%% plot Lorentz energy budget
figureHeight = 5; % unit inches
width2height= 1;

fig = figure('unit','inches','position',...
                [0 0 figureHeight*width2height figureHeight]);
fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 15;
fontsize2 = 12;
markersize1 = 2;
linewidth = 1.5;

kfx = [1 1e1 1e2 1e3 1e4];
plot(kfx, LorentzCycle(:,1),'-ro','linewidth',linewidth);
hold on
plot(kfx,LorentzCycle(:,3),'-go','linewidth',linewidth);
plot(kfx,-LorentzCycle(:,4),'-ko','linewidth',linewidth);
plot(kfx,-LorentzCycle(:,6),'--ko','linewidth',linewidth);
plot(kfx,LorentzCycle(:,3)-LorentzCycle(:,4)-LorentzCycle(:,6),'--bo');
lgnd = legend('C(EAPE,EKE)','C(EKE,ZKE)','D_{fri}(EKE)','D_{vis}(EKE)',...
       'C(EKE,ZKE)+D_{fri}(EKE)+D_{vis}(EKE)');
set(lgnd, 'color', 'none', 'location','southwest','fontsize',fontsize2);
set(gca,'XScale','log','YScale','log','fontsize',fontsize1);
xlabel('\tau_f (days)','fontweight','bold')
ylabel('dEKE/dt (W m^{-2})','fontweight','bold')
axis square
%legend boxoff

%%
figureHeight = 5; % unit inches
width2height= 1;

fig = figure('unit','inches','position',...
                [0 0 figureHeight*width2height figureHeight]);
fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 15;
fontsize2 = 12;
markersize1 = 2;
linewidth = 1.5;


plot(kfx,LorentzCycle(:,3),'-go','linewidth',linewidth);
hold on
plot(kfx,-LorentzCycle(:,2),'-ro','linewidth',linewidth);
plot(kfx,-LorentzCycle(:,5),'-ko','linewidth',linewidth);
plot(kfx,-LorentzCycle(:,2)-LorentzCycle(:,5),'--bo','linewidth',linewidth);
lgnd = legend('C(EKE,ZKE)','C(ZKE,ZAPE)','D_{fri}(ZKE)',...
       'C(ZKE,ZAPE)+D_{fri}(ZKE)');
set(lgnd, 'color', 'none', 'location','southwest','fontsize',fontsize2);
set(gca,'XScale','log','YScale','log','fontsize',fontsize1);
xlabel('\tau_f (days)','fontweight','bold')
ylabel('dZKE/dt (W m^{-2})','fontweight','bold')
axis square
legend boxoff

%%
figureHeight = 5; % unit inches
width2height= 1;

fig = figure('unit','inches','position',...
                [0 0 figureHeight*width2height figureHeight]);
fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 15;
fontsize2 = 12;
markersize1 = 2;
linewidth = 1.5;


hold on
plot(kfx,LorentzCycle(:,1)+LorentzCycle(:,2),'-ro','linewidth',linewidth);
plot(kfx,-LorentzCycle(:,4)-LorentzCycle(:,5),'-ko','linewidth',linewidth);
plot(kfx,-LorentzCycle(:,6),'--ko','linewidth',linewidth);
plot(kfx,-LorentzCycle(:,4)-LorentzCycle(:,5)-LorentzCycle(:,6),'--bo','linewidth',linewidth);
lgnd = legend('C(APE,KE)','D_{fri}(KE)','D_{vis}(KE)',...
       'D_{fri}(KE)+D_{vis}(KE)');
set(lgnd, 'color', 'none', 'location','southwest','fontsize',fontsize2);
set(gca,'XScale','log','YScale','log','fontsize',fontsize1);
xlabel('\tau_f (days)','fontweight','bold')
ylabel('dZKE/dt (W m^{-2})','fontweight','bold')
axis square
legend boxoff