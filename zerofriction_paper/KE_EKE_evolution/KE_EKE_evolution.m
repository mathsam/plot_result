exp_set = {'kfe0', 'kfe1', 'kfe2', 'kfe3', 'kfe4'};

saveDir     = '/home/j1c/analysis/2014/Apr23/';


linecolors = linspecer(length(exp_set),'qualitative');
figureHeight = 3.5; % unit inches
width2height= 2.1;
figure1 = figure('unit','inches','position',[0 0 figureHeight*width2height figureHeight]);

fontname = 'Helvetica';
set(0,'defaultaxesfontname',fontname);
fontsize1 = 15;
fontsize2 = 13;
markersize1 = 2;
linewidth = 0.7;

for i = 1:3
    matfile = [saveDir exp_set{i} '/KEhistory/total.mat'];
    load(matfile)
    t = 1:2:2*length(EKEhistoryTotal);
    p(i) = plot(t, KEhistoryTotal,'color', linecolors(i,:),'linewidth',linewidth)
    hold on
end

for i = 4:5
    matfile = [saveDir exp_set{i} '/KEhistory/total.mat'];
    load(matfile)
    t = 1:2:2*length(EKEhistoryTotal);
    p(i) = plot(t, KEhistoryTotal,'color', linecolors(i,:),'linewidth',linewidth)
    hold on
end

%set(gca,'YTick',[10 100 1000],'YScale','log','YMinorTick','on');
xlabel('time (day)','FontSize',fontsize1,'FontWeight','bold');
ylabel({'KE (m^2 s^{-2})'},'FontSize',fontsize1,'FontWeight','bold');
legend(p(1:3),{'\tau_f=1','\tau_f=10','\tau_f=10^2'},'fontsize',fontsize2)
axh = axes('position',get(gca,'position'),'visible','off'); 
legend(axh,p(4:5),{'\tau_f=10^3','\tau_f=10^4'},'fontsize',fontsize2)