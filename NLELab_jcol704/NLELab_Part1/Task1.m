%% Task 1 - Bisection, Secant, Regula Falsi and Newton's Methods

% clear workspace
clear
clc

% Initialisation
f = @(x) 2*x.^2-8*x+4; % function to evaluate
g = @(x) 4*x-8;        % gradient of function
tol = 1.0e-4;          % tolerance for asserts
x0 = 0.0;              % initial interval left
x1 = 2.0;              % initial interval right
nmax = 50;             % maximum number of iterations

fprintf('Method\t\t\t\tx*\t\t|f(x*)|\t\tEstimates\tf evals\tf'' evals\n');

% Bisection method
[xb,i,n] = Bisection(f, x0, x1, nmax, tol);
assert(abs(f(xb(end))) < tol)
fprintf('Bisection\t\t\t%7.5f\t%7.5e\t%d\t\t\t%d\t\t%d\n',xb(end),abs(f(xb(end))),i,n,0);

% Secant method
[xs,i,n] = Secant(f, x0, x1, nmax, tol);
assert(abs(f(xs(end))) < tol)
fprintf('Secant\t\t\t\t%7.5f\t%7.5e\t%d\t\t\t%d\t\t%d\n',xs(end),abs(f(xs(end))),i,n,0);

% Regula Falsi method and verification
[xrf,i,n] = Regulafalsi(f, x0, x1, nmax, tol);
assert(abs(f(xrf(end))) < tol)
fprintf('Regula Falsi\t\t%7.5f\t%7.5e\t%d\t\t\t%d\t\t%d\n',xrf(end),abs(f(xrf(end))),i,n,0);


% Newton's method and verification
[xn,i,nf,ng] = Newton(f, g, x0, nmax, tol);
assert(abs(f(xn(end))) < tol)
fprintf('Newton''s\t\t\t%7.5f\t%7.5e\t%d\t\t\t%d\t\t%d\n',xn(end),abs(f(xn(end))),i,nf,ng);

% Combined Bisection/Newton's method and verification
[xc,i,nf,ng] = Combined(f, g, x0, x1, nmax, tol);
assert(abs(f(xc(end))) < tol)
fprintf('Bisection/Newton''s\t%7.5f\t%7.5e\t%d\t\t\t%d\t\t%d\n',xc(end),abs(f(xc(end))),i,nf,ng);
