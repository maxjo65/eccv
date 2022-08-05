function W = F0010_compressibleRestriction(p_1, p_2, T_1, T_2, open, par)
% output size
W = zeros(4,1);

% parameters
C_d    = par.C_d;        % [?]      - discharge coefficient
M_j    = par.M_j;        % [kg/mol] - Molar masses
R_j    = par.R_j;        % [J/kgK]  - Specific gas constants
cp_j   = par.cp_j;       % [J/kgK]  - Specific gas constants
D_t    = par.D_t;        % [m]   - Nozzle throat diameter
A_t    = pi*(D_t/2)^2;   % [m2]  - Nozzle throat area

% variable area
A_t    = A_t .* open;

Pi_lin = par.Pi_lin;

% Pressure & temperature drop
dp = sum(p_1) - sum(p_2);

% Switch variable
dp_tan = dp.*par.tan_par;
y = (tanh(dp_tan) + 1)/2;

% Upstream pressure, temperature & concentration
p_us = y.*p_1 + (1-y).*p_2;
p_ds = y.*p_2 + (1-y).*p_1;
T_us = y.*T_1 + (1-y).*T_2;
T_ds = y.*T_2 + (1-y).*T_1;

% Upstream mole fractions
x_us = p_us ./ sum(p_us);

% Average molar mass
M_avg = sum(x_us .* M_j);

% Mole fraction to mass fraction
w_us = x_us .* M_j ./ M_avg;

% mixture gas constant
R_m  = sum(w_us .* R_j);
cp_m = sum(w_us .* cp_j);
g    = cp_m/(cp_m - R_m);     % [-]      - ratio of specific heats

% pressure ratio
pr = sum(p_ds) ./ sum(p_us);

% primary flow
pr_crit = (2/(1+g)).^( g/(g-1) );
Pi      = max(pr, pr_crit);
Pi      = min(Pi,1);
Phi     = sqrt( 2*g./(g-1) .* ( Pi.^(2/g) - Pi.^((g+1)/g)) );
Phi_lin = sqrt( 2*g./(g-1) .* ( Pi_lin.^(2/g) - Pi_lin.^((g+1)/g)) );
Phi(Pi > Pi_lin) = Phi_lin .* (1-Pi)./(1-Pi_lin);
W_c     = sum(p_us) ./ sqrt(R_m.*T_us) .* A_t .* C_d .* Phi;
W_c     = W_c .* tanh(dp_tan);

% Distribute mass flow accoring to mass ratios
W   = W_c .* w_us;

















