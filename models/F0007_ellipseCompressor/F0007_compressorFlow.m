function W_c = F0007_compressorFlow(p_us, p_ds, T_us, w_c, par)

% parameters
k1 = par.k1;
k2 = par.k2;

% constants
g   = 1.4;
R   = 280;
cp  = g*R/(g-1);
D   = 56e-3;

% ideal gas law for density
rho01 = p_us ./ (R.*T_us);

% Pressure Ratio (Pi)
Pi = p_ds./p_us;

% Energy Coefficient (Psi)
% Equation (8.46)
Psi = cp .* T_us .* ( Pi.^( (g-1)/g ) - 1 ) ./ ( w_c.^2 .* D.^2 );

% Flow Coefficient (Phi)
% Equation (8.52)
Psi = max(min(Psi,k2),1e-3);
Phi = k1 .* sqrt(1 - (Psi ./ k2).^2 );

% Compressor mass flow
% Equation (8.53)
W_c = Phi .* rho01 .* w_c .* D.^3;

end