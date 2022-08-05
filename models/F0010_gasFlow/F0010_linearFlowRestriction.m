function W = F0010_linearFlowRestriction(p_1,  p_2, par)
% output size
W = zeros(4,1);

% parameters
C_d = par.C_d;   % [?]      - Convective flow coefficient
M_j = par.M_j; % [kg/mol] - Molar masses
R_j = par.R_j; % [J/kgK]  - Specific gas constants

% Upstream & downstream total pressure
p_1_tot  = sum(p_1);
p_2_tot  = sum(p_2);

% Pressure & temperature drop
dp = p_1_tot - p_2_tot;

dp_tan = dp.*par.tan_par;

% Switch variable
y = (tanh(dp_tan) + 1)/2;

% Upstream pressure, temperature & concentration
p_us = y.*p_1 + (1-y).*p_2;

% Upstream total pressure
p_tot = sum(p_us);

% Upstream mole fractions
x_us = p_us ./ p_tot;

% Average molar mass
M_avg = sum(x_us .* M_j);

% Mole fraction to mass fraction
w_us = x_us .* M_j ./ M_avg;

% linear flow
W_c = tanh(dp_tan) .* C_d .* abs(dp) ;

% Distribute mass flow accoring to mass ratios
W   = W_c .* w_us;
end







