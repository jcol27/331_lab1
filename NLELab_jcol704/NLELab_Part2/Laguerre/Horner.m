function [p0x, p1x, p2x] = Horner(c, x)
%Horner  Evaluate polynomial and its first two derivatives.
% [p0x,p1x,p2x]=Horner(c,x) returns the value at X of a polynomial
% p0x=P(X), together with its derivatives p1x=P'(x) and p2x=P''(x).
% c is a vector of length n+1 whose elements are the coefficients of
% the polynomial in descending powers:
%     P(x) = c(1)*x^n + c(2)*x^(n-1) + ... + c(n)*x + c(n+1)
p0x = c(1);
p1x = 0;
p2x = 0;
for i = 2 : length(c)
    p2x = x*p2x + p1x;
    p1x = x*p1x + p0x;
    p0x = x*p0x + c(i);
end 
p2x = 2*p2x;
