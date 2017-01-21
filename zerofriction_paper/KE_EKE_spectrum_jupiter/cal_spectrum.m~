archiveDir       = '/archive/Junyi.Chai/sigmaCoord/2014/Feb28a_jupiter/';
modSet           = 25:5:40;
filePrefix       = 'Feb28a_jupiter_seg_ave';

R                = 3605.38; % gas constant; 3605.38 for Jupiter; 287 for Earth
psAve            = 3e3;     % unit mb

RADIUS  = 6986.0e3*10.0; % unit m; 6986.0e3*10.0 for Jupiter
p_lowb  = 1;      % for 30 layers, corresponds to 150 mb
p_upperb= 30;
t_start = 1;
t_end = 1;

EKE = zeros(213, 1);
totalE = zeros(213, 1);

for i = 1:length(modSet)
    fileID         = [archiveDir filePrefix num2str(modSet(i)) '.nc'];
    [tmpEKE tmptotalE k energy_k energy_L] = ...
        EnergySpectrum_vors2(fileID,t_start,t_end,p_lowb,p_upperb,RADIUS);
    EKE = EKE + tmpEKE;
    totalE = totalE + tmptotalE;
end

EKE = EKE/length(modSet);
totalE = totalE/length(modSet);
