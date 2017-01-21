ConI     = 10;    % contour interval
pRange   = 1:30;

yTick      = [0.2  0.4  0.6 0.8];
yTickLabel = {'0.2','','','0.8'};
xTick      = [-75 -60 -45  -30 -15 0  15  30  45  60   75];
xTickLabel = {'','-60','','-30','','0','','30','','60',''};

plotField = squeeze(mean(u3d.*v3d, 1));
U2d = U;
plevel1d = pfull/1000;

figure('unit', 'inches', 'position', [0, 0, 4, 2])

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 15;
fontsize2 = 13;
markersize1 = 2;
linewidth = 0.7;
tagFontsize  = 10;
axisFontsize = 14;

 %   NaNIndex = find(abs(plotField)<min_PTflux);
 %   plotField(NaNIndex) = NaN;
    contourf(lat,plevel1d,plotField',20,'linecolor','none')
    maxColorRange = nanmax(abs(plotField(:)));
    colormap(b2r(-maxColorRange,maxColorRange))
    colorbar
    set(gca,'Ydir','reverse')
    hold on
    
    maxU     = 80;
    minU     = -40;
    uRange   = minU:ConI:maxU;
    tagLevel = [-50 -30 -10 10 30 50 70];

    for j = 1:length(uRange)
        if uRange(j) < 0
            dashOrSolid = ':';
        else
            dashOrSolid = '-';
        end
        [C h] = contour(lat,plevel1d(pRange),U2d(:,pRange)',[uRange(j) uRange(j)],'linestyle',dashOrSolid,...
                                                                       'linecolor','black',...
                                                                       'linewidth',1);
        if ismembc(uRange(j),tagLevel)
          tag  = clabel(C,h,'LabelSpacing',10000,'FontSize',tagFontsize); %put labels on the contours
        end
    end

    contour(lat,plevel1d(pRange),U2d(:,pRange)',[0       0],'linecolor','black','linewidth',2, 'linestyle','-');
    set(gca,'xtick',xTick,'xticklabel',xTickLabel,...
            'ytick',yTick,'yticklabel',yTickLabel, 'fontsize', fontsize2)
    
    xlabel('Latitude', 'fontsize', axisFontsize, 'fontweight', 'bold')
    ylabel('Sigma level', 'fontsize', axisFontsize, 'fontweight', 'bold')