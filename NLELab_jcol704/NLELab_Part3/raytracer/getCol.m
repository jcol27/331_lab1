function col = getCol(p,q,r,v,l,shade,a,getMaterial)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
%col=1;

%p=[p{1}(1,1);p{1}(1,2);p{1}(1,3)];
p=p';


if shade
    col=a*getMaterial(p);
    return;
end

q=q';
r=r';
%q=[q{1}(1,1);q{1}(1,2);q{1}(1,3)];
%r=[r{1}(1,1);r{1}(1,2);r{1}(1,3)];


q=q-p;
r=r-p;

n=-cross(q,r);
n=n/norm(n);
m=l-p(:,1);
m=m/norm(m);

dotnm=dot(n,m);

diffuse=max(dotnm,0)^1.5;

[col, glossy, reflect] = getMaterial(p);

if(dotnm>=0)
    spec=2*n-m;
    o=v-p(:,1);   
    alpha=max(dot(spec/norm(spec),o/norm(o)),0);
    alpha=alpha^(1+15*glossy)*diffuse*(0.6*glossy+0.4*reflect);
else
    alpha=0;
end

col=(1-alpha)*(a+(1-a)*diffuse)*col+alpha;


end