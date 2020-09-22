function shade = checkShade(p,l,s,getObj,frame)

for t=0.0:s:0.99
    temp=(1-t)*l+t*p;
    if getObj(temp,frame)
        shade=1;
        return;
    end
end
shade=0;
end