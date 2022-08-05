function [C_min, C_max, C_air, C_clt] = F0014_heatCapacityRates(W_air, W_cl, par)

% parameters
cp_air = par.cp_air;
cp_clt = par.cp_clt;

% heat capacity rates
C_air = W_air.*cp_air;
C_clt = W_cl.*cp_clt;

% max/min rates
C_min = min(C_air, C_clt);
C_max = max(C_air, C_clt);


