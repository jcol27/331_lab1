function found = mobius(p,frame)
found=0;

if frame~=0 % rotates object (if required)
    Rx=[1,0,0;0,cos(frame/180*pi),-sin(frame/180*pi);0,sin(frame/180*pi),cos(frame/180*pi)];
    Ry=[cos(frame/90*pi),0,sin(frame/90*pi);0,1,0;-sin(frame/90*pi),0,cos(frame/90*pi)];
    Rz=[cos(frame/45*pi),-sin(frame/45*pi),0;sin(frame/45*pi),cos(frame/45*pi),0;0,0,1];
    p=Rx*Ry*Rz*p;
end

theta=atan2(p(1),p(3));

r=sqrt(p(1)^2+p(3)^2)-0.7;

freq=0.5;
ct2=cos(theta*freq);
st2=sin(theta*freq);

if (r*ct2+p(2)*st2)^2/0.09+(r*st2-p(2)*ct2)^2/0.016<=1
    found=1;
end


end