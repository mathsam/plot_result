%% interpolate the growthRate first
%wavenumberSet_inv  = linspace(0.1,4,160);
%Sc = linspace(0.1,4,160);
Sc  = beta_inv;

wavenumberSet_inv_I = linspace(0.1,4,400);
Sc_I                = linspace(0.1,4,400);
growthRate2d_I      = interp2(wavenumberSet_inv(:),Sc,growthRate,...
                              wavenumberSet_inv_I(:),Sc_I,'cubic');

%% find the most unstable 1/k


mostUnstableInvK = zeros(size(Sc_I));
for i = 1:length(Sc_I)
    mostUnstableIndex = find(growthRate2d_I(i,:) == ...
                             max(growthRate2d_I(i,:)));
    mostUnstableInvK(i) = wavenumberSet_inv_I(mostUnstableIndex);
end

%%
%imagesc(wavenumberSet_inv_I,Sc_I,growthRate2d_I);
%set(gca,'YDir','reverse')
colormap('hot');
plot(mostUnstableInvK,Sc_I,'w','linewidth',2)
hold on
plot(1.538*Sc_I./(Sc_I+1),Sc_I,'--w','linewidth',2)
legend1 = legend('Numerical 1/k_m','Scaling estimate 1.54\xi/(1+\xi)');
set(legend1,'fontsize',16,...
            'location','southeast')
%contour(wavenumberSet_inv_I,Sc_I,growthRate2d_I,0.2:0.02:1,'linecolor',[0.5 0.5 0.5])
contourf(wavenumberSet_inv_I,Sc_I,growthRate2d_I,0.2:0.02:1,'linecolor','none')
colorbar
plot(mostUnstableInvK,Sc_I,'k','linewidth',2)
plot(1.538*Sc_I./(Sc_I+1),Sc_I,'--k','linewidth',2)
box on
xlim([0.1 3]); ylim([0.1 4])