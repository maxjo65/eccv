function Re = F0017_Reynolds(v, par)
% parameters
rho = par.rho_clt;
mu  = par.mu_clt;
d   = par.d;

% Pipe reynolds number
Re = rho .* v .* d ./ mu;