function dw_c = F0007_shaftTorqueBalance(Tq_em, Tq_c, w_c)

% constants
J_c = 1e-5;
c   = 1e-6;

% shaft friction
Mf = c .* w_c;

% turbo shaft dynamics
% Model 8.3
dw_c = 1/J_c .* ( Tq_em - Tq_c - Mf);

end