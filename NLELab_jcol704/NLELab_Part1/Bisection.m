% Nonlinear equation root finding by the bisection method.
% Inputs
% f      : nonlinear function
% xl, xr : initial root bracket
% nmax   : maximum number of iterations performed
% tol    : numerical tolerance used to check for root
% Outputs
% x      : one-dimensional array containing estimates of root
% i      : number of estimates considered
% n      : number of function evaluations

% Hint 1: 
% Iterate until either a root has been found or maximum number of iterations has been reached

% Hint 2:
% Check for root each iteration, making use of tol

% Hint 3:
% Update the bracket each iteration

function [x, i, n] = Bisection(f, xl, xr, nmax, tol)
    n = 2; % Function evaluation counter, includes two initial f(x) calls
    i = 2; % Estimates considered counter, includes two initial estimates
    fxl = f(xl);
    fxr = f(xr);
    x = [xl,xr];
    
    % Loop while the largest magnitude f(x) value of the root brackets is 
    % greater than tol and the number of evaluations is less than the max
    while max(abs(fxl),abs(fxr)) > tol && i <= nmax
        % Find new estimate
        x_new = xl + (xr-xl)/2;
        x = [x x_new];
        fxnew = f(x_new);
        n = n + 1;
        i = i + 1;
        
        % Replace either xl or xr depending on function evaluation sign, 
        % calculate new fxl or fxr, update function evaluations counter
        if fxnew*fxr > 0
            xr = x_new;
            fxr = fxnew;
        else
            xl = x_new;
            fxl = fxnew;
        end
    end
    
    % Warning message if number of iterations exceeded
    if i >= nmax
        fprintf("Warning: maximum number of iterations reached\n");
    end
end

