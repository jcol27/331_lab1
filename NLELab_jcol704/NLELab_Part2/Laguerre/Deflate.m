function [c, rem] = Deflate(c, x)
%Deflate  Coefficients of a deflated polynomial.
% [c,rem]=Deflate(c,x) returns the coefficients c of the deflated
% polynomial.
% Remainder rem is the remainder after deflation: Up to rounding error, rem
% will be zero if x is an exact root.
rem = c(1);
c(1) = 0;
for i = 2 : length(c)
    q = c(i);
    c(i) = rem;
    rem = x*rem + q;
end
c(1) = []; % remove the first element in the array

if eps(100) < abs(rem)
    warning('ENGSCI331:BadRoot', 'Specified root may be inaccurate')
end
