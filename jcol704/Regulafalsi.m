% Nonlinear equation root finding by the Regula falsi method.
% Inputs
% f      : nonlinear function
% xl, xr : initial root bracket
% nmax   : maximum number of iterations performed
% tol    : numerical tolerance used to check for root
% Outputs
% x      : one-dimensional array containing estimates of root
% i      : number of estimates considered
% n      : number of function evaluations

function [x, i, n] = Regulafalsi(f, xl, xr, nmax, tol)
    n = 1; % Function evaluation counter
    i = 2; % Estimates considered counter, includes two initial estimates
    x = [xl,xr];
    points = [];
    fpoints = [];
    fxend = f(x(end));
    
    % Loop while the largest magnitude f(x) value of the root brackets is 
    % greater than tol and the number of evaluations is less than the max
    while abs(fxend) > tol && i <= nmax
        % Find last two estimates within bracket
        n = n + 1;
        j = 1;
        count = 0;
        while j < size(x,2) && count < 1
            if x(end-j) >= xl && x(end-j) <= xr && (f(x(end-j)))*fxend < 0
                points = [points x(end-j) x(end)];
                fpoints = [fpoints f(x(end-j)) fxend];
                n = n + 1;
                count = count + 1;
            end
            j = j + 1;
            n = n + 1;
        end             
                        
        % Find new estimate
        x_new = points(end) - (points(end)-points(end-1))*((fpoints(end)/...
            ((fpoints(end))-fpoints(end-1))));
        x = [x x_new];
        fxend = f(x(end));
        n = n + 1;
        i = i + 1;                
    end

    % Warning message if number of iterations exceeded
    if i >= nmax
        fprintf("Warning: maximum number of iterations reached\n");
    end    
end

