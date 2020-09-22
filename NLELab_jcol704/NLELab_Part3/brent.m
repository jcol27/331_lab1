function [xmin,fmin,k] = brent(f,a,b,tol,maxiter)
%brent Function minimisation with Brent's search
% Inputs
% f       : function handle
% a       : lower limit of interval of uncertainty
% b       : upper limit of interval of uncertainty
% tol     : convergence tolerance
% maxiter : maximum number of iterations

% Outputs
% xmin    : the minimizer of the function
% fmin    : the minimum function value
% k       : number of iterations completed

c = 0.5*(a + b); % set the third point to be mid-point of the interval of uncertainty.

% Complete this function
k = 2;
xmin = [];
fmin = [];
while abs(max([a,b,c]) - min([a,b,c])) > tol && k <= maxiter
    num = ((b-a)^2)*(f(b) - f(c)) - ((b-c)^2)*(f(b)-f(a));
    denom = ((b-a)*(f(b)-f(c)))-(b-c)*(f(b)-f(a));
    x = b - 0.5*(num/denom);
    
    if f(a) > f(b) && f(a) > f(c)
        a = x;
        
    elseif f(b) > f(a) && f(b) > f(c)
        b = x;
    else
        c = x;
    end
    k = k + 1;
    xmin = [xmin x];
    fmin = [fmin f(x)];
    
end

        


end
