% plot the climitology fields for my criticality and eddy scale paper
% ------ combine contour field of zonal wind and contourf field of EKE
% compare full and reduced GCM
maxU     = 33;
minU     = -5;
ConI     = 5;    % contour interval
pRange   = 4:30; % don't plot the upper stratosphere
uRange   = minU:ConI:maxU;
tagLevel = [-5 10 25];

maxEKE   = 770;
minEKE   = 50;
EKEI     = 100; % interval for EKE



% axis adjustment
xTick      = [-75 -60 -45  -30 -15 0  15  30  45  60   75];
xTickLabel = {'','-60','','-30','','0','','30','','60',''};
yTick      = [200  400  600 800];
yTickLabel = {'200','','','800'};
TURN_OFF_X = -1; % if turn off xlabel
TURN_OFF_Y = -1;% if turn off ylabel

% fontsizes
tagFontsize  = 10;
axisFontsize = 12;

% size of figure
figureHeight = 1.25*1.75; % unit inches
width2height= 16/9*2;

figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

ha = tight_subplot(1,2,0.02,[0.2 0.05],[0.1 0.1]) ;

% ==================== zonal wind and EKE first ==========================
axes(ha(1))


% plot the EKE shadking first
contourf(lat,pfull(pRange),EKE2d(:,pRange)',minEKE:EKEI:maxEKE,'linecolor','none')
%colorbar('FontSize',axisFontsize);

% contour the westerly in solid lines and easterly in dashed line
hold on
box on

for i = 1:length(uRange)
    if uRange(i) < 0
        dashOrSolid = ':';
    else
        dashOrSolid = '-';
    end
    [C h] = contour(lat,pfull(pRange),U2d(:,pRange)',[uRange(i) uRange(i)],'linestyle',dashOrSolid,...
                                                                   'linecolor','black',...
                                                                   'linewidth',1);
    if ismembc(uRange(i),tagLevel)
      tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
    end
end

contour(lat,pfull(pRange),U2d(:,pRange)',[0       0],'linecolor','black','linewidth',2, 'linestyle','-');
caxis([minEKE maxEKE])

if TURN_OFF_X > 0
    xTickLabel = cell(size(xTickLabel));
end
if TURN_OFF_Y > 0
    yTickLabel = cell(size(yTickLabel));
end

set(gca,'xtick',xTick,'xticklabel',xTickLabel,...
        'ytick',yTick,'yticklabel',yTickLabel)


%the trick here is to plot the contour twice, with different number of levels. First just use color, second use dash line. So the label put later on will not be too crowded.
set(gca,'YDir','reverse') %set the pressure coordinate to be reversed
if TURN_OFF_X < 0
xlabel('Latitude','fontsize',axisFontsize,'FontWeight','bold')
end
if TURN_OFF_Y < 0
ylabel('Pressure (mb)','fontsize',axisFontsize,'FontWeight','bold')
end
set(gca,'fontsize',axisFontsize,'linewidth',1)

% plot tropopause
plot(lat,tropP,'k','linewidth',2)
plot(lat,tropP_WMO,'--','linewidth',2,'color', [0.5 0.5 0.5])


% ==================== reduced GCM ========================================
axes(ha(2))

TURN_OFF_X = -1; % if turn off xlabel
TURN_OFF_Y = 1;% if turn off ylabel

% plot the EKE shadking first
contourf(lat,pfull(pRange),EKE2d_reduced(:,pRange)',minEKE:EKEI:maxEKE,'linecolor','none')


% contour the westerly in solid lines and easterly in dashed line
hold on
box on

for i = 1:length(uRange)
    if uRange(i) < 0
        dashOrSolid = ':';
    else
        dashOrSolid = '-';
    end
    [C h] = contour(lat,pfull(pRange),U2d_reduced(:,pRange)',[uRange(i) uRange(i)],'linestyle',dashOrSolid,...
                                                                   'linecolor','black',...
                                                                   'linewidth',1);
    if ismembc(uRange(i),tagLevel)
      tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
    end
end

contour(lat,pfull(pRange),U2d_reduced(:,pRange)',[0       0],'linecolor','black','linewidth',2, 'linestyle','-');
caxis([minEKE maxEKE])

if TURN_OFF_X > 0
    xTickLabel = cell(size(xTickLabel));
end
if TURN_OFF_Y > 0
    yTickLabel = cell(size(yTickLabel));
end
set(gca,'xtick',xTick,'xticklabel',xTickLabel,...
        'ytick',yTick,'yticklabel',yTickLabel)


%the trick here is to plot the contour twice, with different number of levels. First just use color, second use dash line. So the label put later on will not be too crowded.
set(gca,'YDir','reverse') %set the pressure coordinate to be reversed
if TURN_OFF_X < 0
xlabel('Latitude','fontsize',axisFontsize,'FontWeight','bold')
end
if TURN_OFF_Y < 0
ylabel('Pressure (mb)','fontsize',axisFontsize,'FontWeight','bold')
end
set(gca,'fontsize',axisFontsize,'linewidth',1)

% plot tropopause
plot(lat,tropP_reduced,'k','linewidth',2)
plot(lat,tropP_WMO_reduced,'--','linewidth',2,'color', [0.5 0.5 0.5])
colorbar('FontSize',axisFontsize,'LineWidth',1);

%% print the figure into pdf format
print_pdf('/home/j1c/Jul19.pdf',gcf)