% Nonlinear equation root finding in n dimensions using Newton's Method.
% Inputs
% n        : number of dimensions for Newton's method
% func     : function handle for system of nonlinear equations f_i(x) -> f(x,i)
% x0       : vector of initial root estimates for each independent variable
% h        : step size for numerical estimate of partial derivatives
% max_iter : maximum number of iterations performed
% tol      : numerical tolerance used to check for root
% Outputs
% x        : array (n-row matrix) containing estimates of root

% Hint 1: 
% Include the initial root estimate as the first column of x

% Hint 2:
% Use MATLAB in-built functionality for solving the matrix equation for vector of updates, delta

% Hint 3:
% Check for root each iteration, continuing until the maximum number of iterations has been reached

function x = NewtonMultiVar(n, f, x0, h, max_iter, tol)
    % Initialization of variables
    k = 0;      % Iteration counter
    epsilon = 2*tol;    % Initial infinity norm value
    x = x0;
    
    while epsilon > tol && k < max_iter
        % Get Jacobian, calculate right hand side vector for system
        J = Jacobian(f,x(:,end),h,n);
        b = zeros(n,1);
        for i = 1:n
            b(i,1) = -f(x(:,end),i);
        end
        
        % Solve system of linear equations J*X = b
        X = linsolve(J,b);
        x = [x, x(:,end) + X];
        
        % Create array to evaluate infinite norm on
        for i = 1:n
            A(i) = f(x(:,end),i);
        end

        % Calculate new infinite norm, update iteration count
        epsilon = norm(A, inf);
        k = k + 1;
    end
end