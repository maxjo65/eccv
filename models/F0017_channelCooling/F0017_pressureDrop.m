function dp = F0017_pressureDrop(v, Re,  par)
% parameters
rho = par.rho_clt;
d   = par.d;
L   = par.L;

% Darcy-weisbach friction factor
f = 64 ./ (Re + 0.01);

% pressure drop
dp =  L .* f .* rho./2 .* v.^2 ./ d;