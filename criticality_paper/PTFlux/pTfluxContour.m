% contourf PT flux for gamma = 0.1, 1, 10
% put PT contour on it
% put tropopause on it


PTfluxmax      = 4;
PTfluxmin      = PTfluxmax*0.2;
PTfluxInterval = 0.5;

PTLevel   = 260:10:400;
PTtagLevel = [270 290 310 330 350];

pRange   = 4:30; % don't plot the upper stratosphere


% axis adjustment
xTick      = [-75 -60 -45  -30 -15 0  15  30  45  60   75];
xTickLabel = {'','-60','','-30','','0','','30','','60',''};
yTick      = [200  400  600 800];
yTickLabel = {'200','','','800'};
TURN_OFF_X = 1; % if turn off xlabel
TURN_OFF_Y = -1;% if turn off ylabel

% fontsizes
tagFontsize  = 10;
axisFontsize = 12;

% size of figure
figureHeight = 1.25*1.75*3; % unit inches
width2height= 16/9/3*1.5;

figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

ha = tight_subplot(3,1,0.02,[0.15 0.05],[0.15 0.2]) ;

% ==================== gamma = 0.1 ==========================
axes(ha(1))

pTflux2d = pTflux2d_gamma01;
PT2d     = PT2d_gamma01;
tropP    = tropP_gamma01;


pfullI    = linspace(pfull(1),pfull(30),150);
latI      = linspace(lat(1),lat(length(lat)),length(lat)*5);
pTflux2dI = interp2(pfull(:)',lat(:),pTflux2d,pfullI(:)',latI(:));
maskIndex = abs(pTflux2dI(:)) < PTfluxmin;
pTflux2dI(maskIndex) = NaN;

contourf(latI,pfullI,pTflux2dI',-PTfluxmax:PTfluxInterval:PTfluxmax,...
           'linecolor','none');
hold on
caxis([-PTfluxmax PTfluxmax])
colorbar('FontSize',axisFontsize,'LineWidth',1);

for i = 1:length(PTLevel)
    [C h] = contour(lat,pfull(pRange),PT2d(:,pRange)',[PTLevel(i) PTLevel(i)],...
                                                                   'linecolor','black',...
                                                                   'linewidth',1);
    hold on
    if ismembc(PTLevel(i),PTtagLevel)
      tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
    end
end

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

ylabel('Pressure (mb)','fontsize',axisFontsize,'FontWeight','bold')

set(gca,'fontsize',axisFontsize,'linewidth',1)
ylim([pfull(pRange(1)) pfull(pRange(length(pRange)))])

% plot tropopause
plot(lat,tropP,'k','linewidth',2)


% ------------------------ gamma = 1 -------------------------------------
pTflux2d = pTflux2d_gamma1;
PT2d     = PT2d_gamma1;
tropP    = tropP_gamma1;


PTfluxmax      = 20;
PTfluxmin      = PTfluxmax*0.2;
PTfluxInterval = 2;

TURN_OFF_X = 1; % if turn off xlabel
TURN_OFF_Y = -1;% if turn off ylabel


axes(ha(2))

pfullI    = linspace(pfull(1),pfull(30),150);
latI      = linspace(lat(1),lat(length(lat)),length(lat)*5);
pTflux2dI = interp2(pfull(:)',lat(:),pTflux2d,pfullI(:)',latI(:));
maskIndex = abs(pTflux2dI(:)) < PTfluxmin;
pTflux2dI(maskIndex) = NaN;

contourf(latI,pfullI,pTflux2dI',-PTfluxmax:PTfluxInterval:PTfluxmax,...
           'linecolor','none');
hold on
caxis([-PTfluxmax PTfluxmax])
colorbar('FontSize',axisFontsize,'LineWidth',1);

for i = 1:length(PTLevel)
    [C h] = contour(lat,pfull(pRange),PT2d(:,pRange)',[PTLevel(i) PTLevel(i)],...
                                                                   'linecolor','black',...
                                                                   'linewidth',1);
    hold on
    if ismembc(PTLevel(i),PTtagLevel)
      tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
    end
end

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

ylabel('Pressure (mb)','fontsize',axisFontsize,'FontWeight','bold')

set(gca,'fontsize',axisFontsize,'linewidth',1)
ylim([pfull(pRange(1)) pfull(pRange(length(pRange)))])

% plot tropopause
plot(lat,tropP,'k','linewidth',2)


% ------------------------ gamma = 10 -------------------------------------
pTflux2d = pTflux2d_gamma10;
PT2d     = PT2d_gamma10;
tropP    = tropP_gamma10;


PTfluxmax      = 60;
PTfluxmin      = 10;
PTfluxInterval = 5;

xTick      = [-75 -60 -45  -30 -15 0  15  30  45  60   75];
xTickLabel = {'','-60','','-30','','0','','30','','60',''};

axes(ha(3))

pfullI    = linspace(pfull(1),pfull(30),150);
latI      = linspace(lat(1),lat(length(lat)),length(lat)*5);
pTflux2dI = interp2(pfull(:)',lat(:),pTflux2d,pfullI(:)',latI(:));
maskIndex = abs(pTflux2dI(:)) < PTfluxmin;
pTflux2dI(maskIndex) = NaN;

contourf(latI,pfullI,pTflux2dI',-PTfluxmax:PTfluxInterval:PTfluxmax,...
           'linecolor','none');
hold on
caxis([-PTfluxmax PTfluxmax])
colorbar('FontSize',axisFontsize,'LineWidth',1);

for i = 1:length(PTLevel)
    [C h] = contour(lat,pfull(pRange),PT2d(:,pRange)',[PTLevel(i) PTLevel(i)],...
                                                                   'linecolor','black',...
                                                                   'linewidth',1);
    hold on
    if ismembc(PTLevel(i),PTtagLevel)
      tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
    end
end



set(gca,'xtick',xTick,'xticklabel',xTickLabel,...
        'ytick',yTick,'yticklabel',yTickLabel)


%the trick here is to plot the contour twice, with different number of levels. First just use color, second use dash line. So the label put later on will not be too crowded.
set(gca,'YDir','reverse') %set the pressure coordinate to be reversed

xlabel('Latitude','fontsize',axisFontsize,'FontWeight','bold')

ylabel('Pressure (mb)','fontsize',axisFontsize,'FontWeight','bold')

set(gca,'fontsize',axisFontsize,'linewidth',1)
ylim([pfull(pRange(1)) pfull(pRange(length(pRange)))])

% plot tropopause
plot(lat,tropP,'k','linewidth',2)