figureHeight = 4; % unit inches
figureWidth= 7/2;
figure1 = figure('unit','inches','position',[0 0 figureWidth figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
ha = tight_subplot(2,1,[0.05, 0.1],[0.1 0.05],[0.15 0.02]);

fontsize1 = 12;
fontsize2 = 9;
linesize1 = 1.5;
linesize2 = 0.75;


xTick      = [0 30 60  90 120 150 180 210 240 270 300 330 360];
xTickLabel = {'','30','','90','','150','','210','','270','','330'};
xTickLabelBlank = cell(size(xTickLabel));
yTick      = [-90 -60 -30 0 30 60 90];
yTickLabel = {'','-60','-30','0', '30','60',''};

axes(ha(1))

load /home/j1c/plotResults/zerofriction_paper/wavenum3/eddy.mat

x = 1:5:128; y = 1:3:64;
bt_u = mean(u3d, 3); bt_v = mean(v3d, 3);
quiver(lon(x),lat(y), bt_u(x,y)',bt_v(x,y)');
h = legend('barotropic');
set(h, 'fontsize', fontsize2);
hold on
quiver(250, -80, 20, 0, 'LineWidth', 0.5)
set(gca, 'XTick', xTick', 'xTickLabel', xTickLabelBlank, ...
    'yTick', yTick, 'yTickLabel', yTickLabel, 'fontsize', fontsize1);
xlim([0 360]); ylim([-90 90])
ylabel('Latitude', 'fontsize', fontsize1)

axes(ha(2))
refLevel = 10;
d = 15;
bc_u = u3d(:,:,refLevel) - u3d(:,:,refLevel+d);
bc_v = v3d(:,:,refLevel) - v3d(:,:,refLevel+d);
quiver(lon(x),lat(y),bc_u(x,y)',bc_v(x,y)')
h = legend('baroclinic');
set(h, 'fontsize', fontsize2);
hold on
quiver(250, -80, 20, 0,'LineWidth', 0.5)
set(gca, 'XTick', xTick', 'xTickLabel', xTickLabel, ...
    'yTick', yTick, 'yTickLabel', yTickLabel, 'fontsize', fontsize1);
xlim([0 360]); ylim([-90 90])
xlabel('Longitude', 'fontsize', fontsize1)
ylabel('Latitude', 'fontsize', fontsize1)