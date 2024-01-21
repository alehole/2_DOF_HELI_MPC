
dt = 0.1;
% Discrete time model
sys = ss(Ac, Bc, Cc, 0); % There is no D matrix so 0.
ds = c2d(sys, dt);
A = ds.a;
B = ds.b;
C = ds.c;
D = ds.d;

N = 20;  % Prediction horizon length

nx = size(A,1);
nu = size(B,2);
ny = size(C,1);
nz = N*(nx + nu + 2*ny);

%bounds Deviation form
zL=(-Inf*ones(nz,1));
zU=(Inf*ones(nz,1));
Umax = 3; % Max 3 V
Umin = 0; % Min 0 V
zL(1:N,1) = Umin-V_mp_op;
zL(N+1:2*N,1) = Umin-V_my_op;
zU(1:N,1) = Umax-V_mp_op;
zU(N+1:2*N,1) = Umax-V_my_op;


Ki = [-0.1,0.1]; % Integrator gain
