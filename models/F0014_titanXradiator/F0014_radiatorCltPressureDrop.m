function dp = F0014_radiatorCltPressureDrop(v, par)
% parameters
HtH   = par.HtH;
c_dp  = par.c_dp_clt;
rho   = par.rho_clt;

% pressure drop
dp = HtH .* rho .* ( c_dp(1) .* v.^2 + c_dp(2) .* v );

