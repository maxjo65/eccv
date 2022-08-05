function W_th = F0008_throttleFlow(alpha, p_us, p_ds, T_us, par)

% model parameters
a0 = par.a0;
a1 = par.a1;
a2 = par.a2;

% Parameters
cp_j = par.cp_j; % [J/kgK]  - Specific heats
M_j  = par.M_j;  % [kg/mol] - Molar masses
R_j  = par.R_j;  % [J/kgK]  - Specific gas constant


% total pressures
p_us_tot = sum(p_us);
p_ds_tot = sum(p_ds);

% Mole fractions
x_us     = p_us ./ p_us_tot;

% Average molar mass
M_avg = sum(x_us .* M_j);

% Mole fraction to mass fraction
w_us = x_us .* M_j ./ M_avg;

% Mixture gas constant & specific heat
R_m  = sum(w_us .* R_j);
cp_m = sum(w_us .* cp_j);

% specific heat ratio
cv_m = cp_m - R_m;
g    = cp_m ./ cv_m;

% effective area
Aeff = a0 + a1.*alpha + a2 .* alpha.^2;

% pressure ratio
Pi = p_ds_tot./p_us_tot;

% Pi_lim
Pi_lim = max( Pi, ...
             (2./(g+1)).^( g./(g-1) ) ...
             );

% Psi
Psi = sqrt( ...
            2.*g./(g-1) .*  ...
            ( Pi_lim.^(2./g) - Pi_lim.^((g+1)./g) ) ...
           );


       
       
       
       
% mass flow
W_th = p_us_tot./sqrt(R_m.*T_us) .* Aeff .* Psi;

end