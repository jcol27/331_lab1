function J = Jacobian( f, x, h, n)
%Computes the numerical derivative of a function, using central differences
%and a step size of h.

% Inputs
% f      : function handle for a nonlinear function
% x      : vector corresponding to the point at which the derivatives should
%          be computed
% n      : number of dimensions for the function input: x
% h      : step size for numerical estimate of partial derivative

% Outputs
% J      : partial derivative matrix (Jacobian)

J = zeros(n,n);
for i = 1:n
    for j = 1:n
        h_j = zeros(n,1);
        h_j(j) = h;
        J(i,j) = (f(x+h_j,i)-f(x-h_j,i))/(2*h);
    end
end