figureHeight = 2.5*3; % unit inches
width2height= 16/9/2.3;

fig = figure('unit','inches','position',...
                [0 0 figureHeight*width2height figureHeight]);
ha = tight_subplot(3,1,0.02,[0.1 0.05],[0.15 0.05]) ;

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 15;
fontsize2 = 13;
markersize1 = 2;
linewidth = 0.7;
tagFontsize  = 10;
axisFontsize = 14;

xTick      = [-75 -60 -45  -30 -15 0  15  30  45  60   75];
xTickLabel = {'','-60','','-30','','0','','30','','60',''};
xTickLabelBlank = cell(size(xTickLabel));
TURN_OFF_X = -1; % if turn off xlabel
TURN_OFF_Y = -1;% if turn off ylabel

axes(ha(1));

load /home/j1c/plotResults/zerofriction_paper/momenum_flux_cospectra/Apr23_kfe0_upper.mat

C = combCp2d;
C(abs(C)<max(C(:))*0.01) = NaN;
C_p = C; C_p(C_p<0) = 0;
C_n = C; C_n(C_n>0) = 0;
contour(lat(latRange), combPhaseSpeed, C_p, 10, 'linecolor', 'k');
hold on
contour(lat(latRange), combPhaseSpeed, C_n, 10, 'linecolor', 'k','LineStyle','-.');
ylim([-35 35])
plot(lat,umean(:,pLevel)./cos(lat*pi/180),'--k')

set(gca,'xtick',xTick,'xticklabel',xTickLabelBlank)

     
axes(ha(2));
load /home/j1c/plotResults/zerofriction_paper/momenum_flux_cospectra/Apr23_kfe3_upper.mat

C = combCp2d;
C(abs(C)<max(C(:))*0.0001) = NaN;
C_p = C; C_p(C_p<0) = 0;
C_n = C; C_n(C_n>0) = 0;
contour(lat(latRange), combPhaseSpeed, C_p, 10, 'linecolor', 'k');
hold on
contour(lat(latRange), combPhaseSpeed, C_n, 10, 'linecolor', 'k','LineStyle','-.');
ylim([-35 35])
plot(lat,umean(:,pLevel)./cos(lat*pi/180),'--k')
ylabel('Phase speed/cos(lat) (m/s)', 'fontsize', fontsize1);
set(gca,'xtick',xTick,'xticklabel',xTickLabelBlank)


axes(ha(3));
load /home/j1c/plotResults/zerofriction_paper/momenum_flux_cospectra/Apr23_kfe3_lower.mat

C = combCp2d;
C(abs(C)<max(C(:))*0.0001) = NaN;
C_p = C; C_p(C_p<0) = 0;
C_n = C; C_n(C_n>0) = 0;
contour(lat(latRange), combPhaseSpeed, C_p, 10, 'linecolor', 'k');
hold on
contour(lat(latRange), combPhaseSpeed, C_n, 10, 'linecolor', 'k','LineStyle','-.');
ylim([-35 35])
plot(lat,umean(:,pLevel)./cos(lat*pi/180),'--k')
xlabel('Latitude', 'fontsize', fontsize1, 'fontweight', 'bold');
set(gca,'xtick',xTick,'xticklabel',xTickLabel)