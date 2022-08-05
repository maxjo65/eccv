function [V, Q_gen] = F0002_pStackVoltage(I, T, par)
% inputs
% i   [A]     - current
% Ta  [K]     - anode inlet temperature
% Tc  [K]     - cathode inlet temperature
% pa  [Pa]    - anode inlet pressure
% pc  [Pa]    - cathode inlet pressure
% TDa [K]     - anode water dewpoint temperature
% TDc [K]     - cathode water dewpoint temperature

% fitting parameters
j_0    = par.j_0;    % [A/cm2]   - exchange current density
alpha  = par.alpha;  % [-]       - reaction transfer coefficient 
ASR    = par.ASR;    % [ohm*cm2] - area-specific resistance
U_0    = par.U_0;    % [V]       - open circuit voltage

% current density
j = I / 300; % [A/cm2];
j = max(j, 0);

% activation voltage
R     = 8.314;
F     = 96485;
V_act = R .* T ./ (alpha.*4.*F) .* log((j+1e-3)./j_0); 

% ohmic losses
V_ohmic = j*ASR;

% total voltage output
V = U_0 - V_act - V_ohmic;

% Heat generation
dh   = 285.8e3;                % [J/mol] - heat of formation (liquid)
% dh     = 241.8e3;                % [J/mol] - heat of formation (vapor)
P_elec = I .* V;              % [W]     - electric power
P_tot  = I ./ (2*F) .* dh;   % [W]     - total power
Q_gen  = P_tot - P_elec;         % [W]     - heat generation

end








