function W_split = F0007_multicomponentFlow(p_us, W_tot, par)
% output size
W = zeros(3,1);

% total pressure
p_tot = sum(p_us);

% partial pressures
p_r  = p_us(1);
p_v  = p_us(2);
p_N2 = p_us(3);

% mole fractions
x_r   = p_r  ./ p_tot;
x_v   = p_v  ./ p_tot;
x_N2  = p_N2 ./ p_tot;

% average mass
M_avg = sum([x_r, x_v, x_N2] .* [par.M_r, par.M_H2O, par.M_N2]);

% mole fraction to mass fraction
w_r   = x_r  .* par.M_r   ./ M_avg;
w_v   = x_v  .* par.M_H2O ./ M_avg;
w_N2  = x_N2 .* par.M_N2  ./ M_avg;

% outlet species convective mass flow
W_split = W_tot .* [w_r; w_v; w_N2];

end