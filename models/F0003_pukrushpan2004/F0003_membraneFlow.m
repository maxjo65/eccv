function [W_an, W_ca] = F0003_membraneFlow(lambda_an, lambda_ca, j, lambda_m, T, par)

% parameters
A   = par.A_fc; % [cm2] - cell area
t_m = par.t_m;  % [cm]  - membrane thickness

% constants
F     = 96485;  % [C/mol]   - Faradays constant
R     = 8.314;  % [J/(molK] - gas constant 
M_H2O = 0.018;  % [kg/mol]  - water molecular mass

rho_mb_dry = 0.002; % [kg/cm^3] - membrane dry density;
M_mb_dry   = 1.1;   % [kg/mol]  - membrane dry equivalent weight 

% electro-osmotic drag coefficient
n_d = 0.0029 .* lambda_m.^2 + 0.05 .* lambda_m;

% membrane diffusivity
D                  = 1e-6;
D(lambda_m >= 2)   = 1e-6 * (1 + 2*(lambda_m-2));
D(lambda_m >= 3)   = 1e-6 * (3 - 1.67*(lambda_m-3));
D(lambda_m >= 4.5) = 1.25e-6;
D_w                = D.*exp(2416*(1/303 - 1/T));

% Water concentrations on each side
c_an = rho_mb_dry ./ M_mb_dry .* lambda_an; % [mol/cm3] - water concentration at anode
c_ca = rho_mb_dry ./ M_mb_dry .* lambda_ca; % [mol/cm3] - water concentration at cathode

% Drag flow
W_drag =   M_H2O .* A .* n_d .* j / F;

% Diffusive flow
W_diff = M_H2O .* A .* D_w .* (c_an - c_ca)/t_m;

% Combined membrane flow
W_m = W_drag + W_diff;

% limits
W_m( lambda_an < 1e-1 & W_m > 0 ) = 0;
W_m( lambda_ca < 1e-1 & W_m < 0 ) = 0;

% output: positive towards cathode
W_an = [0; 0; -W_m; 0];
W_ca = [0; 0;  W_m; 0];
end