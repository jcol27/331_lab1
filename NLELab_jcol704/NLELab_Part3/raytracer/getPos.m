function x = getPos(i,j,n)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here

% plane is y=1
x=zeros(3,1);
x(1)=((i-1)/(n-1)-0.5)*2;
x(3)=((j-1)/(n-1)-0.5)*2;
x(2)=1;

end