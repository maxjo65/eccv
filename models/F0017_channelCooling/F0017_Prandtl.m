function Pr = F0017_Prandtl(par)
% parameters
cp = par.cp_clt;
mu = par.mu_clt;
k  = par.k_clt;

% Prandtl number
Pr = cp .* mu ./ k;