function found = trefoil(p,frame)
found=0;

if p(1)*p(1)+p(2)*p(2)+p(3)*p(3)>=1;
     return;
end

if frame~=0 % rotates object (if required)
    Rx=[1,0,0;0,cos(frame/180*pi),-sin(frame/180*pi);0,sin(frame/180*pi),cos(frame/180*pi)];
    Ry=[cos(frame/90*pi),0,sin(frame/90*pi);0,1,0;-sin(frame/90*pi),0,cos(frame/90*pi)];
    Rz=[cos(frame/45*pi),-sin(frame/45*pi),0;sin(frame/45*pi),cos(frame/45*pi),0;0,0,1];
    p=Rx*Ry*Rz*p;
end

f = @(theta) (0.3*sin(theta)+0.6*sin(2*theta)-p(1))^2+(0.3*cos(theta)-0.6*cos(2*theta)-p(3))^2+(0.3*sin(3*theta)-p(2))^2;

mindist=0.1;
for theta1=0:0.1*pi:2*pi-0.001
    dist=f(theta1);
    if dist<mindist
        theta2=theta1;
        mindist=dist;
    end
end

if mindist<0.1
    [~,dist] = fminbnd(f,theta2-0.05*pi,theta2+0.05*pi,optimset('MaxIter',5,'Display','off'));
    %[~,dist,~] = golden(f,theta2-0.05*pi,theta2+0.05*pi,0.001,10);
    %[~,dist,~] = brent(f,theta2-0.05*pi,theta2+0.05*pi,0.001,10);
else
    return;
end

if(dist(end)<0.01)
    found=1;
    return
end

end