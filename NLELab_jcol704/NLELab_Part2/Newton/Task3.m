%% Task 3 - System of Nonlinear Equations

% clear workspace
clear all
clc

% initialisation
tol = 1.0e-6;      % numerical tolerance
h = 1.0e-4;        % step size for central difference
nmax = 100;         % maximum number of iterations
x0 = [0.8;2];        % initial root estimate
func = @func_task3;  % function handle

% 2D Newton's method and verification
disp(['NewtonMultiVar starting at point (x0,y0) = (' num2str(x0(1)),',',num2str(x0(2)),')']);
xn = NewtonMultiVar(2, func, x0, h, nmax, tol);
assert(abs(func(xn(:,end),1)) <= tol)
assert(abs(func(xn(:,end),2)) <= tol)
disp(['NewtonMultiVar converged to root at (x,y) = (' num2str(xn(1,end)),',',num2str(xn(2,end)),') in ',num2str(length(xn)),' iterations']);