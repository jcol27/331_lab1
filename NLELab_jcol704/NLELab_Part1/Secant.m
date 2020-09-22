% Nonlinear equation root finding by the secant method.
% Inputs
% f      : nonlinear function
% x0, x1 : initial root bracket
% nmax   : maximum number of iterations performed
% tol    : numerical tolerance used to check for root
% Outputs
% x      : one-dimensional array containing estimates of root
% i      : number of estimates considered
% n      : number of function evaluations

function [x, i, n] = Secant(f, x0, x1, nmax, tol)
    n = 2; % Function evaluation counter
    i = 2; % Estimates considered counter, includes two initial estimates
    fx0 = f(x0);
    fx1 = f(x1);
    x = [x0,x1];
    
    % Loop while the largest magnitude f(x) value of the root brackets is 
    % greater than tol and the number of evaluations is less than the max
    while max(abs(fx0),abs(fx1)) > tol && i <= nmax
        % Find new estimate
        x_new = x1 - (x1-x0)*((fx1)/(fx1-fx0));
        x = [x x_new];
        i = i + 1;
        
        % Update x0, x1, fx0, fx1, n
        x0 = x1;
        x1 = x_new;
        fx0 = fx1;
        fx1 = f(x1);
        n = n + 1;
    end
    
    % Warning message if number of iterations exceeded
    if i >= nmax
        fprintf("Warning: maximum number of iterations reached\n");
    end    
    
end

