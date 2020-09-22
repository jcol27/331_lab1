function [xmin,fmin,k] = golden(f,a,b,tol,maxiter)
%golden Function minimisation with the golden section search
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

% Initialisation
tau = 0.5*(sqrt(5) - 1);        % Inverse of the golden ratio
alpha = a + (1 - tau)*(b - a);  
beta = a + tau*(b - a);             
falpha = f(alpha);
fbeta = f(beta);

% Store first points to later output
xmin=[alpha,beta];
fmin=[falpha,fbeta];

for k = 2:maxiter
  if abs(b-a) < tol
    break
  end
  if falpha <= fbeta
    % Code goes here
    %
    %
    b = beta;    
    
    % store arrays of sampled points
    xmin=[xmin alpha];
    fmin=[fmin falpha];
  else
    % Code goes here
    %
    %
    a = alpha;
    
    % store arrays of sampled points
    xmin=[xmin beta];
    fmin=[fmin fbeta];
  end
  
  alpha = a + (1 - tau)*(b - a);  
  beta = a + tau*(b - a); 
  falpha = f(alpha);
  fbeta = f(beta);
  
end
