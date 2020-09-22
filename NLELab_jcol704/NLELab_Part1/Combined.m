% Nonlinear equation root finding by the combined bisection/Newton's method
% Inputs
% f      : nonlinear function
% g      : nonlinear function derivative (gradient)
% xl, xr : initial root bracket
% nmax   : maximum number of iterations performed
% tol    : numerical tolerance used to check for root
% Outputs
% x      : one-dimensional array containing estimates of root
% i      : number of estimates considered
% nf      : number of function (f) evaluations
% ng      : number of gradient (g) evaluations

function [x, i, nf, ng] = Combined(f, g, xl, xr, nmax, tol)
    nf = 1; % Function evaluation counter
    ng = 0; % Function derivative evaluation counter
    i = 3; % Estimates considered counter, includes two initial estimates
    fxl = f(xl);
    x = [xl,xr,xl+(xr-xl)/2];
    
    
    while abs(f(x(end))) > tol && i <= nmax
        % Attempt to use Newtons method
        x_new = x(end) - f(x(end))/g(x(end));
        nf = nf + 2;
        ng = ng + 1;
        i = i + 1;
        
        % Check if bisection necessary, if so do bisection 
        if x_new < xl || x_new > xr 
           x_new = xl + (xr - xl)/2;
        end
        
        x = [x x_new];
        
        if fxl*f(x_new) < 0
            xr = x_new;
            nf = nf + 1;
        else
            xl = x_new;
            fxl = f(x_new);
            nf = nf + 1;
        end
    end
    
    % Warning message if number of iterations exceeded
    if i >= nmax
        fprintf("Warning: maximum number of iterations reached\n");
    end
end

