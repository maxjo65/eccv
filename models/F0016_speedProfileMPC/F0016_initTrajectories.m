function [v_0, Tq_0, u_Tq_0] = F0016_initTrajectories(v_ref, alpha, par)
% speed linearization
v_0      = repmat(v_ref, 100, 1);

% torque linearization
alpha_i = ( alpha(2:par.N) + alpha(1:par.N-1)  ) /2;
Fg      = par.m .* 9.82 .* sin(alpha_i);
Ft      = Fg;
Tq_w    = Ft ./ par.r_w;
Tq_0    = [Tq_w ./ par.gam; 0];  
u_Tq_0  = Tq_0;
end