% Nonlinear equation root finding by Newton's method
% Inputs
% f      : nonlinear function
% g      : nonlinear function derivative (gradient)
% x0     : initial root estimate
% nmax   : maximum number of iterations performed
% tol    : numerical tolerance used to check for root
% Outputs
% x      : one-dimensional array containing estimates of root
% i      : number of estimates considered
% nf      : number of function (f) evaluations
% ng      : number of gradient (g) evaluations

function [x, i, nf, ng] = Newton(f, g, x0, nmax, tol)
    % Initialize some variables
    nf = 1;
    ng = 0;
    i = 0;
    x = [x0];
    fx0 = f(x0);

    
    while abs(fx0) > tol && i <= nmax
        % Find new estimate, update fx0
        x0 = x0 - fx0/g(x0);
        fx0 = f(x0);
        x = [x x0];
        
        % Update counters
        i = i + 1;
        nf = nf + 1;
        ng = ng + 1;
    end
    
    % Warning message if number of iterations exceeded
    if i >= nmax
        fprintf("Warning: maximum number of iterations reached\n");
    end
end
