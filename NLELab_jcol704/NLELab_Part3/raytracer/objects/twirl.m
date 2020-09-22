function found = twirl(p,frame)
found=0;

if frame~=0 % rotates object (if required)
    Rx=[1,0,0;0,cos(frame/180*pi),-sin(frame/180*pi);0,sin(frame/180*pi),cos(frame/180*pi)];
    Ry=[cos(frame/90*pi),0,sin(frame/90*pi);0,1,0;-sin(frame/90*pi),0,cos(frame/90*pi)];
    Rz=[cos(frame/45*pi),-sin(frame/45*pi),0;sin(frame/45*pi),cos(frame/45*pi),0;0,0,1];
    p=Rx*Ry*Rz*p;
end

t=atan2(p(1),p(3));

if (p(1)-0.7*sin(t))^2+p(2)^2+(p(3)-0.7*cos(t))^2>0.25
    return
end

freq=8;

f = @(t) ((0.7+0.2*sin(freq*t)).*sin(t)-p(1)).^2+((0.7+0.2*sin(freq*t)).*cos(t)-p(3)).^2+(0.2*cos(freq*t)-p(2)).^2;

[~,dist] = fminbnd(f,t(1)-pi/(freq+2),t(1)+pi/(freq+2),optimset('MaxIter',5,'Display','off'));
%[~,dist,~]=golden(f,t(1)-pi/(freq+2),t(1)+pi/(freq+2),0.001,10);
%[~,dist,~]=brent(f,t-pi/(freq+2),t+pi/(freq+2),0.001,10);


if(dist(end)<0.01)
    found=1;
end

end