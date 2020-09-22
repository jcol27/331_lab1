function t = testRay(x,v,s,getObj,frame)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
for t=1:s:2
    p=(1-t)*v+t*x;
    if getObj(p,frame)
        return;
    end
end
t=100;
end    