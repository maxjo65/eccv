function eq = g(z, d, m, r_w, gam, beta, dx)
% opt. variables
v    = z(1:3:end);
Tq   = z(2:3:end);
u_Tq = z(3:3:end);

% known signals
alpha = d(1:1:end);

% residual vector
eq   = [];

% distance, time, velocity & acceleration
v_i  = ( v(2:end)  + v(1:end-1)) /2;
dv   = v(2:end) - v(1:end-1);
dt   = dx ./ v_i;

% interval driving resistance
alpha_i = ( alpha(2:end) + alpha(1:end-1)  ) /2;
Fg      = m .* 9.82 .* sin(alpha_i);
Fi      = m .* dv./dt;

% tractive force required
Ft      = Fg +  Fi;

% required wheel torque
Tq_w = Ft ./ r_w;

% required motor torque
Tq_req = Tq_w ./ gam;  

% torque balance
Tq_i =( Tq(2:end)  + Tq(1:end-1)) /2;
eq   = [ eq; Tq_req - Tq_i];

% torque dynamics
u_Tq_i = ( u_Tq(2:end) + u_Tq(1:end-1)  ) /2;
eq     = [eq; ((Tq(2:end) - Tq(1:end-1))./dt - beta .* (u_Tq_i - Tq_i))];
end
















