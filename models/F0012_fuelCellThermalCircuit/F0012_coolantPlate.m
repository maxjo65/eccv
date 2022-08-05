function dT_cp = F0012_coolantPlate(T_an, T_ca, T_cp, Q_cl, par)
% parameters
C  = par.C_cp;
R9 = par.R9;

% output
dT_cp = 1./C .*( -2/R9 * T_cp + 1/R9 * T_ca + 1/R9 * T_an - Q_cl);