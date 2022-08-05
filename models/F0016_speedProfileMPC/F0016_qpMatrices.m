function [P, c, A, b, G, h] = F0016_qpMatrices(v_ref, v, Tq,  v_0, Tq_0, u_Tq_0, alpha, par)

% variable sizes
nz = 3;
ng = 2;

% parameters
m    = par.m;
r_w  = par.r_w;
gam  = par.gam;
beta = par.beta;
dx   = par.dx;
N    = par.N;


% bounds
v_max   = par.v_max;
v_min   = par.v_min;
Tq_max  = par.Tq_max;
Tq_min  = par.Tq_min;


% previous trajectory
z_0 = [v_0, Tq_0, u_Tq_0]';
z_0 = z_0(:);


% reference
r = [repmat(v_ref, N, 1), Tq_0, u_Tq_0]';
r = r(:);


% linearization trajectory
g_0  = zeros(ng*N-ng, 1);
dg_0 = zeros(length(g_0), length(z_0));


% constraints at t = t0
A_eq_t0       = zeros(2, length(z_0));
A_eq_t0(1,1)  = 1;
A_eq_t0(2,2)  = 1;
b_eq_t0       = [v; Tq];


% constraints at t0 <= t <= tf
for i = 1:N-1
    z_idx = (i*nz+1-nz):(i*nz+nz);
    g_idx = (i*ng+1-ng):(i*ng);
    d_idx = i:(i+1);
    g_0(g_idx)         =     F0016_G( z_0(z_idx), alpha(d_idx), m, r_w, gam, beta, dx );
    dg_0(g_idx, z_idx) = F0016_gradG( z_0(z_idx), alpha(d_idx), m, r_w, gam, beta, dx );
end

% inequality constraints
A_ineq = [];
b_ineq = [];


% equality constraint matrix
A_eq = [A_eq_t0; dg_0];
b_eq = [b_eq_t0; -g_0 + dg_0 * z_0];
A_eq = real(A_eq);
b_eq = real(b_eq);


% cost function
Q     = diag([1 1e-8 1e-8]);
tmp   = repmat({Q}, N, 1);
H     = blkdiag(tmp{:});
H     = (H+H')/2;
f     = - r' * H;


% bounds
LB = repmat([v_min; Tq_min; Tq_min], N, 1);
UB = repmat([v_max; Tq_max; Tq_max], N, 1);
A_bnd = [eye(nz*N); -eye(nz*N)];
b_bnd = [UB; -LB];


% output
P  = H(:);
c  = f;
A  = A_eq(:);
b  = b_eq;
G_ = [A_ineq; A_bnd];
G  = G_(:);
h  = [b_ineq; b_bnd];
end






