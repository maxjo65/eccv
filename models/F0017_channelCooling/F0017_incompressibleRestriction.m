function dp = F0017_incompressibleRestriction(W, dr,  par)

% parameters
C_d = par.C_d;
d   = par.d;
rho = par.rho_clt;

% restriction area
Ar = dr.^2 * pi / 4;

% diameter ratio
beta = dr./d;

% volumetric flow
Q = W ./ rho;

% pressure drop
dp = 1/2 .* rho .* (1 - beta.^4) .* (Q ./ (C_d .* Ar)).^2;