function v = F0017_velocity(W, par)

% parameters
rho = par.rho_clt;
d   = par.d;

% area
A = pi .* d.^2 / 4;

% velocity
v = W ./ (rho .* A);
