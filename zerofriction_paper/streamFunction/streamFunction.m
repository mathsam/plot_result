%% plot the results
mat_set = {'Apr23_kfe0.mat', 'Apr23_kfe2.mat', 'Apr23_kfe4.mat'};

maxU_set     = [ 35  5  15];
minU_set     = [-35 -5 -15];
ConI     = 5;    % contour interval
pRange   = 1:96; % don't plot the upper stratosphere
tagLevel_set = {[-30 -20 -10 10 20 30],...
                [-5 5],...
                [-15 -5 5 15]};
yTick      = [200  400  600 800];
yTickLabel = {'200','','','800'};


figureHeight = 2.5*2; % unit inches
width2height= 4.1/4.9;

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
TURN_OFF_X = -1; % if turn off xlabel
TURN_OFF_Y = -1;% if turn off ylabel

for i = 1:length(mat_set)
    axes(ha(i))
    load(mat_set{i})

    plotField = Phi/1e9;
%    plotField(abs(plotField)<2e-2) = NaN;
    plevel1d  = plevel1dI;
 %   NaNIndex = find(abs(plotField)<min_PTflux);
 %   plotField(NaNIndex) = NaN;
    contourf(lat,plevel1d/100,plotField',20,'linecolor','none')
    maxColorRange = 2*nanstd(plotField(:));
    colormap(b2r(-maxColorRange,maxColorRange))
    colorbar
    set(gca,'Ydir','reverse')
    hold on
    
    maxU     = maxU_set(i);
    minU     = minU_set(i);
    uRange   = minU:ConI:maxU;
    tagLevel = tagLevel_set{i};

    for j = 1:length(uRange)
        if uRange(j) < 0
            dashOrSolid = ':';
        else
            dashOrSolid = '-';
        end
        [C h] = contour(lat,plevel1d(pRange)/100,plotField(:,pRange)',[uRange(j) uRange(j)],'linestyle',dashOrSolid,...
                                                                       'linecolor','black',...
                                                                       'linewidth',1);
        if ismembc(uRange(j),tagLevel)
          tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
        end
    end

 %   contour(lat,plevel1d(pRange)/100,U2d(:,pRange)',[0       0],'linecolor','black','linewidth',2, 'linestyle','-');

    if i < length(mat_set)
        xTickLabeltmp = cell(size(xTickLabel));
    else
        xTickLabeltmp = xTickLabel;
    end


    set(gca,'xtick',xTick,'xticklabel',xTickLabeltmp,...
            'ytick',yTick,'yticklabel',yTickLabel)
    
    %xlabel('Latitude');
    if i == 2
        ylabel('Pressure (mb)','fontsize',axisFontsize,'FontWeight','bold')
    end
end

xlabel('Latitude','fontsize',axisFontsize,'FontWeight','bold')