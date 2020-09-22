function [x, success] = Laguerre(c, max_iter, tol)
% [x, success]=Laguerre(c,tol) finds a root of the polynomial x using Laguerre's
% method, also indicates the success/failure with logical variable success.
% Inputs
% c         : is a vector of length n+1 whose elements are the coefficients
%             of the polynomial in descending powers:
%             P(x) = c(1)*x^n + c(2)*x^(n-1) + ... + c(n)*x + c(n+1)
% max_iter  : the maximum number of iterations
% tol       : the tolerance on the residual function value
% Outputs
% x         : the determined root
% success   : a 0/1 variable as a flag indicating whether a root was found

x = complex(rand, rand); % Initial random iterate

% Polynomial degree (highest power)
n = numel(c) - 1;

fprintf('it     re(x)       im(x)    |p(x)|   |p''(x)|  |p''''(x)|    |step|\n')
% -------12-(123456789,-123456789)-123456789-123456789.-123456789..-123456789--

success = false;
for it = 0 : max_iter
    
    % Evaluate the polynomial
    [p, dp, ddp] = Horner(c, x);
    
    if imag(x)<0
        ch='-';
    else
        ch='+';
    end
    fprintf('%2d %9.3g %s%9.3gi %9.3g %9.3g %9.3g ', it, real(x), ch, abs(imag(x)), abs(p), abs(dp), abs(ddp))
    
    % Check for root before division, below, by polynomial's value
    if abs(p) <= tol
        fprintf('        -\n')
        success = true;
        break
    end
    
    %%%%%%%%%%%%%%%%%%%%%%% INSERT CODE BELOW HERE %%%%%%%%%%%%%%%%%%%%%%%
    
    %% Determine alpha, using Laguerre's method
    G = dp/p;
    H = (dp/p)^2 - ddp/p;
    
    denom = max((G + sqrt((n-1)*(n*H - G^2))),(G - sqrt((n-1)*(n*H - G^2))));
    alpha = n/denom;
    
    % Failure is unlikely, but possible. Set alpha to some random complex
    % number if iteration fails, using: alpha = complex(rand, rand);
    
    if it == max_iter && success == false
        alpha = complex(rand, rand);
    end
    
    %%%%%%%%%%%%%%%%%%%%%%% INSERT CODE ABOVE HERE %%%%%%%%%%%%%%%%%%%%%%%
    
    x = x - alpha;
    
    fprintf('%9.3g\n', abs(alpha))
end

end
