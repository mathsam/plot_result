figureHeight = 3*2; % unit inches
figureWidth= 8;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);

fontsize1 = 16;
fontsize2 = 14;
linesize1 = 0.75;
linesize2 = 0.75;
ha = tight_subplot(2,1,[0.05, 0.1],[0.1 0.05],[0.15 0.02]);

xTick      = [0 30 60  90 120 150 180 210 240 270 300 330 360];
xTickLabel = {'','30','','90','','150','','210','','270','','330'};
xTickLabelBlank = cell(size(xTickLabel));
yTick      = [50 60 70 80];
yTickLabel = {'50','60','70','80'};

axes(ha(1))
load /home/j1c/plotResults/zerofriction_paper/primary_mode_jupiter/Feb28e_kRange5_8.mat

x = 1:11:640; y = 1:3:320;
bt_u = mean(u3d, 3); bt_v = mean(v3d, 3);
quiver(lon(x),lat(y), bt_u(x,y)',bt_v(x,y)','Color','k','LineWidth',linesize1);
h = legend('barotropic');
set(h, 'fontsize', fontsize2);
hold on
quiver(250, 55, 20, 0, 'LineWidth', 0.5,'Color','k','LineWidth',linesize1)
set(gca, 'XTick', xTick', 'xTickLabel', xTickLabelBlank, ...
    'yTick', yTick, 'yTickLabel', yTickLabel, 'fontsize', fontsize1);
xlim([0 360]); ylim([50 80])
ylabel('Latitude', 'fontsize', fontsize1)
xlabel('Longitude', 'fontsize', fontsize1)

axes(ha(2))
U2d = squeeze(v3d(:,275,:));
uRange   = 6:2:6;
tagLevel = [-4 4];
for j = 1:length(uRange)
    if uRange(j) < 0
        dashOrSolid = ':';
    else
        dashOrSolid = '-';
    end
    [C h] = contour(lon,pfull/3e3,U2d',[uRange(j) uRange(j)],'linestyle',dashOrSolid,...
        'linecolor','black',...
        'linewidth',1);
    if any(abs(uRange(j)-tagLevel)<1e-10)
        tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
    end
end

contour(lon,pfull/3e3,U2d',[0       0],'linecolor','black','linewidth',2, 'linestyle','-');
legend('Meridional wind');
set(gca,'YDir','reverse')
xlabel('Longitude');
ylabel('Sigma level');