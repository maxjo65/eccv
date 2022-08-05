function [Q_gen, I_em] = F0009_currentDemand(Tq_em, V, w_em, par)
% Parameters
e     = par.e;
c1    = par.c1;
c2    = par.c2;
c3    = par.c3;

% Losses
P_0 = c1 + c2 * w_em + c3 * w_em.^2 ;

% Motor power
P_em  = Tq_em .* w_em;
P_el  = e.*P_em + P_0;
I_m   = P_el ./ V;

% Generator power
P_em  = abs(Tq_em) .* w_em;
P_el  = (P_em - P_0)./e;
I_g   = P_el ./ V;

% switching variables
ym = (tanh(Tq_em - pi) + 1)/2;
yg = -(tanh(pi - Tq_em) + 1)/2;

% Current
I_em = ym .* I_m + yg .* I_g;

% Power loss
Q_gen = abs(abs(I_em) .* V - abs(Tq_em .* w_em)); 

end