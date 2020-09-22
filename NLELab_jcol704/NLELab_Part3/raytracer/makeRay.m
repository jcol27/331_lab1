function [t_out,p,shade] = makeRay(x,v,l,s,getObj,tol,frame)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
found=0;
for t=1:s:2
    p=(1-t)*v+t*x;
    if getObj(p,frame)
        found=1;
        break;
    end
end

if found   
    while (s>tol || ~found)
        s=s/2;
        if found
            t=t-s;
        else
            t=t+s;
        end
        p=(1-t)*v+t*x;
        found=getObj(p,frame);
    end
    
    t_out=t;

    shade=checkShade(p,l,0.1,getObj,frame);
else
    p=[0;0;0];
    t_out=100;
    shade=0;
end

end
    
    