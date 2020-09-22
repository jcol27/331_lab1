%% Task7.m

clear;
clc;

f1 = @(x) x^4 - 8*x^3 + 24*x^2 - 32*x + 17;
f2 = @(x) 2 - exp(-2*x^2 + 8*x - 8);

%% Golden Section Search
if true 
  %% Test cases for Golden Section search
  tol = 0.0001;
  n = 50;
  
  a = 0;
  b = 3;
  
  %% Function f1 plots
  figure(1);
  subplot(2,3,1);
  x=linspace(a,b,100);
  y=arrayfun(f1,x);
  plot(x,y);
  xlabel('x'), ylabel('f1(x)'), title('Golden: f_1(x)=x^4-8x^3+24x^2-32x+17')
  [xmin,fmin,k] = golden(f1, a, b, tol, n);
  disp(['Golden section applied to f1 exited after ' num2str(k) ' iterations.']);
  hold on;
  plot(xmin,fmin,'o');
  plot(xmin(end),fmin(end),'bo','MarkerFaceColor', 'b');
  hold off;
  temp=fmin;
  subplot(2,3,2);
  plot(1:length(fmin),fmin);
  xlabel('k'), ylabel('f1^(k)'), title('Golden: f_1^{(k)}');
  
  subplot(2,3,3);
  plot(1:length(fmin),xmin);
  xlabel('k'), ylabel('x^(k)'), title('Golden f_1: x^{(k)}');
  
  %% Function f2 plots
  subplot(2,3,4);
  a = 0;
  b = 3;
  x=linspace(a,b,100);
  y=arrayfun(f2,x);
  plot(x,y);  
  xlabel('x'), ylabel('f2(x)'), title('Golden: f_2(x)=2-exp(-2x^2+8x-8)');
  [xmin,fmin,k] = golden(f2, a, b, tol, n);
  disp(['Golden section applied to f2 exited after ' num2str(k) ' iterations.']);
  hold on;
  plot(xmin,fmin,'o');
  plot(xmin(end),fmin(end),'bo','MarkerFaceColor', 'b');
  hold off;
  
  subplot(2,3,5);
  plot(1:length(fmin),fmin);
  xlabel('k'), ylabel('f2^(k)'), title('Golden: f_2^{(k)}');
  
  subplot(2,3,6);
  plot(1:length(fmin),xmin);
  xlabel('k'), ylabel('x^(k)'), title('Golden f_2: x^{(k)}');
end

%% Brent Search
if true
  %%
  % Test cases for Golden Section search
  tol = 0.0001;
  n = 50;
  
  a = 0;
  b = 3;
  
  figure(2);
  subplot(2,3,1);
  x=linspace(a,b,100);
  y=arrayfun(f1,x);
  plot(x,y);
  xlabel('x'), ylabel('f1(x)'), title('Brent: f_1(x)=x^4-8x^3+24x^2-32x+17');
  [xmin,fmin,k] = brent(f1, a, b, tol, n);
  disp(['Brent''s method applied to f1 exited after ' num2str(k) ' iterations.']);
  hold on;
  plot(xmin,fmin,'o');
  plot(xmin(end),fmin(end),'bo','MarkerFaceColor', 'b');
  hold off;
  
  subplot(2,3,2);
  plot(1:length(fmin),fmin);
  xlabel('k'), ylabel('f1^(k)'), title('Brent: f_1^{(k)}');
  
  subplot(2,3,3);
  plot(1:length(fmin),xmin);
  xlabel('k'), ylabel('x^(k)'), title('Brent f_1: x^{(k)}');
  
  %% Function f2 plots
  subplot(2,3,4);
  a = 0;
  b = 3;
  x=linspace(a,b,100);
  y=arrayfun(f2,x);
  plot(x,y);  
  xlabel('x'), ylabel('f2(x)'), title('Brent: f_2(x)=2-exp(-2x^2+8x-8)');
  [xmin,fmin,k] = brent(f2, a, b, tol, n);
  disp(['Brent''s method applied to f2 exited after ' num2str(k) ' iterations.']);
  hold on;
  plot(xmin,fmin,'o');
  plot(xmin(end),fmin(end),'bo','MarkerFaceColor', 'b');
  hold off;
  
  subplot(2,3,5);
  plot(1:length(fmin),fmin);
  xlabel('k'), ylabel('f2^(k)'), title('Brent: f_2^{(k)}');
  
  subplot(2,3,6);
  plot(1:length(fmin),xmin);
  xlabel('k'), ylabel('x^(k)'), title('Brent f_2: x^{(k)}');
end

