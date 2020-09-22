%% Task 5 - System of Nonlinear Equations

% clear workspace
clear all
clc

% initialisation
tol = 1.0e-6;        % numerical tolerance
h = 1.0e-4;          % step size for central difference
nmax = 50;           % maximum number of iterations
n = 3;               % number of nonlinear equations
x0 = [1.2;3.1;1.9];  % initial root estimate
func = @func_task5;  % function handle

% Multivariable Newton's method and verification
xn = NewtonMultiVar(n, func, x0, h, nmax, tol);
for i = 1:n
    assert(abs(func(xn(:,end),i)) <= tol)
end
disp('NewtonMultiVar converged to root at:');
disp(xn(:,end));
disp(['in ',num2str(length(xn)),' iterations']);