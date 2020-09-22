function data = renderScene(res,quality,v,l,a,bg,obj,mat,frame)

s1=0.5;
s2=0.01;
data=zeros(res,res,3);

tol=1/10^(quality+2)*256/res;
n=res+2;
xobj=cell(n);
shade=cell(n);
t=cell(n);
tic
fprintf('Rendering\n');

for i=1:n
    test=1;
    t2=zeros(n);
    shade2=zeros(n);
    xobj2=zeros(n,3);
    for j=1:n
        x=getPos(i,j,n);
        
        if ~test
            [t2(j),xobj2(j,:),shade2(j)]=makeRay(x,v,l,s2,obj,tol,frame);
            
             if t2(j)==100
                 test=1;
             end            
        else
            if testRay(x,v,s1,obj,frame)~=100
                k=j;
                while k>1
                    x=getPos(i,k,n);                
                    [t2(k),xobj2(k,:),shade2(k)]=makeRay(x,v,l,s2,obj,tol,frame);
                    if t2(k)==100
                        break;
                    end
                    k=k-1;
                end
                test=0;
            else
                t2(j)=100;
            end
        end
    end
    t{i}=t2;
    xobj{i}=xobj2;
    shade{i}=shade2;
    fprintf('.');
    if mod(i,80)==0
        fprintf('\n');
    end       
end

todo=[];
for i=2:n-1
    for j=2:n-1
        mint=min([t{i-1}(j),t{i}(j-1),t{i+1}(j),t{i}(j+1)]);
        if t{i}(j)==100 && mint~=100
            todo=[todo;[i,j]];
        end
    end
end

 changed=1;

 fprintf('\nFilling in\n');
 count=0;
 while changed
     changed=0;
     fprintf('.');
     count=count+1;
     if mod(count,80)==0
        fprintf('\n');
     end       
     newtodo=[];
     numel=size(todo);
     for k=1:numel(1)
         i=todo(k,1);
         j=todo(k,2);
         x=getPos(i,j,n);
         [tt,xobj{i}(j,:),shade{i}(j)]=makeRay(x,v,l,s2,obj,tol,frame);
         if tt<99
             changed=1;
             if i>1 && t{i-1}(j)==100
                 newtodo=[newtodo;[i-1,j,tt]];
                 t{i-1}(j)=99;
             end
             if i<n && t{i+1}(j)==100
                 newtodo=[newtodo;[i+1,j,tt]];
                 t{i+1}(j)=99;                 
             end
             if j>1 && t{i}(j-1)==100
                 newtodo=[newtodo;[i,j-1,tt]];
                 t{i}(j-1)=99;                 
             end
             if j<n && t{i}(j+1)==100
                 newtodo=[newtodo;[i,j+1,tt]];
                 t{i}(j+1)=99;                 
             end
             t{i}(j)=tt;
         end
     end
     todo=newtodo;
 end

 
 todo=[];
 for i=2:n-1
     for j=2:n-1
         if t{i}(j)~=100 && ~shade{i}(j)
             if shade{i-1}(j) || shade{i+1}(j) || shade{i}(j-1) || shade{i}(j+1)
                todo=[todo;[i,j]];
             end
         end
     end
 end
 
 fprintf('\nRefining shadows\n');
 changed=1;
 count=0;
 while changed
     changed=0;
     fprintf('.');
     count=count+1;
     if mod(count,80)==0
        fprintf('\n');
     end        
     newtodo=[];
     numel=size(todo);
     for k=1:numel(1)
         i=todo(k,1);
         j=todo(k,2);
                 
         p=[xobj{i}(j,1);xobj{i}(j,2);xobj{i}(j,3)];

         shade{i}(j)=checkShade(p,l,s2,obj,frame);
         
         if shade{i}(j)==1
             changed=1;
             if i>1 && ~shade{i-1}(j)==1 && t{i-1}(j)<99
                 newtodo=[newtodo;[i-1,j]];
                 shade{i-1}(j)=0.5;
             end
             if i<n && ~shade{i+1}(j)==1 && t{i+1}(j)<99
                 newtodo=[newtodo;[i+1,j]];
                 shade{i+1}(j)=0.5;                                
             end
             if j>1 && ~shade{i}(j-1)==1 && t{i}(j-1)<99
                 newtodo=[newtodo;[i,j-1]];
                 shade{i}(j-1)=0.5;                              
             end
             if j<n && ~shade{i}(j+1)==1 && t{i}(j+1)<99
                 newtodo=[newtodo;[i,j+1]];
                 shade{i}(j+1)=0.5;                                  
             end
         end
     end
     todo=newtodo;
 end
 fprintf('\n');
 
 for i=2:n-1
     for j=2:n-1
         if t{i}(j)>=99
             data(i-1,j-1,:)=bg;
         elseif t{i+1}(j)<99 && t{i}(j+1)<99
             data(i-1,j-1,:)=getCol(xobj{i}(j,:),xobj{i+1}(j,:),xobj{i}(j+1,:),v,l,shade{i}(j),a,mat);
         elseif t{i-1}(j)<99 && t{i}(j-1)<99
             data(i-1,j-1,:)=getCol(xobj{i}(j,:),xobj{i-1}(j,:),xobj{i}(j-1,:),v,l,shade{i}(j),a,mat);            
         elseif t{i-1}(j)<99 && t{i}(j+1)<99
             data(i-1,j-1,:)=getCol(xobj{i}(j,:),xobj{i-1}(j,:),xobj{i}(j+1,:),v,l,shade{i}(j),a,mat);                         
         elseif t{i+1}(j)<99 && t{i}(j-1)<99
             data(i-1,j-1,:)=getCol(xobj{i}(j,:),xobj{i+1}(j,:),xobj{i}(j-1,:),v,l,shade{i}(j),a,mat);                         
         else
             data(i-1,j-1,:)=bg;             
         end
     end
 end
 

toc
end