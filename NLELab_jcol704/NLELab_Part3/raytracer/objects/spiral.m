function found = spiral(p,frame)

found=0;

r=0.8;
s=1/(4*pi);
d=0.1;

% If point not inside spiral, return nothing ie found = 0
if p(1)^2+p(2)^2 > (r+d)^2 || p(1)^2+p(2)^2 < (r-d)^2
    return;
end

f = @(t) (r*sin(t)-p(1))^2+(r*cos(t)-p(2))^2+(t*s-p(3))^2;

a=0.45*pi; % Fix at 0.45, seems to be beginning
b=2.4*pi;

% dist = fmin
%[~,dist] = fminbnd(f,a,b,optimset('MaxIter',5,'Display','off'));
[~,dist,~] = golden(f,a,b,0.001,10);
%[~,dist,~] = brent(f,a,b,0.001,10);

if dist(end)<d^2
    found=1;
end

end