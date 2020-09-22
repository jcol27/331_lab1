%% Task 4

% clear workspace
clear all
clc

% initialisation
tol = 1.0e-6;          % numerical tolerance
h = 1.0e-4;            % step size for central difference
nmax = 50;             % maximum number of iterations
x0_p1 = [0;3];        % initial root estimate - point 1
x0_p2 = [2;3];         % initial root estimate - point 2
x0_p3 = [2;0];         % initial root estimate - point 3

%x0_p1 = [2000;2001];        % initial root estimate - point 1
%x0_p2 = [2000;2001];         % initial root estimate - point 2
%x0_p3 = [2000;2001];         % initial root estimate - point 3

func = @func_task4_1;  % function handle
%func = @func_task4_2;  % function handle

% Two function two variable Newton's method for each starting location
xn_p1 = NewtonMultiVar(2, func, x0_p1, h, nmax, tol);
xn_p2 = NewtonMultiVar(2, func, x0_p2, h, nmax, tol);
xn_p3 = NewtonMultiVar(2, func, x0_p3, h, nmax, tol);

% Need to create arrays for x and y axes for each line
k1 = 1:length(xn_p1);
k2 = 1:length(xn_p2);
k3 = 1:length(xn_p3);

% Create our 1d arrays of function values at (x1_k,x2_k)
y1f1 = zeros(1,length(xn_p1));
y2f1 = zeros(1,length(xn_p2));
y3f1 = zeros(1,length(xn_p3));
y1f2 = zeros(1,length(xn_p1));
y2f2 = zeros(1,length(xn_p2));
y3f2 = zeros(1,length(xn_p3));
for i=1:length(xn_p1)
	y1f1(i)=func(xn_p1(:,i),1);
	y1f2(i)=func(xn_p1(:,i),2);
end
for i=1:length(xn_p2)
	y2f1(i)=func(xn_p2(:,i),1);
	y2f2(i)=func(xn_p2(:,i),2);
end
for i=1:length(xn_p3)
	y3f1(i)=func(xn_p3(:,i),1);
	y3f2(i)=func(xn_p3(:,i),2);
end


%% start figure for algorithm visualisation
figure(1), clf

% create top left plot for function 1
subplot(3,2,1)
plot(k1,y1f1,'m-o', 'DisplayName',['Starting Point ','(',num2str(x0_p1(1)),', ',num2str(x0_p2(2)),')'])
hold on
plot(k2,y2f1,'g--o', 'DisplayName',['Starting Point ','(',num2str(x0_p2(1)),', ',num2str(x0_p2(2)),')'])
plot(k3,y3f1,'k-.o', 'DisplayName',['Starting Point ','(',num2str(x0_p3(1)),', ',num2str(x0_p3(2)),')'])
hold off
grid on, xlabel('k'), ylabel('f1(k)')
legend('show')

% create middle left plot for function 2
subplot(3,2,3)
plot(k1,y1f2,'m-o', 'DisplayName',['Starting Point ','(',num2str(x0_p1(1)),', ',num2str(x0_p1(2)),')'])
hold on
plot(k2,y2f2,'g--o', 'DisplayName',['Starting Point ','(',num2str(x0_p2(1)),', ',num2str(x0_p2(2)),')'])
plot(k3,y3f2,'k-.o', 'DisplayName',['Starting Point ','(',num2str(x0_p3(1)),', ',num2str(x0_p3(2)),')'])
hold off
grid on, xlabel('k'), ylabel('f2(k)')
legend('show')

% create bottom left plot for max of f1 and f2
subplot(3,2,5)
semilogy(k1,max(y1f1,y1f2),'m-o', 'DisplayName',['Starting Point ','(',num2str(x0_p1(1)),', ',num2str(x0_p1(2)),')'])
hold on
semilogy(k2,max(y2f1,y2f2),'g--o', 'DisplayName',['Starting Point ','(',num2str(x0_p2(1)),', ',num2str(x0_p2(2)),')'])
semilogy(k3,max(y3f1,y3f2),'k-.o', 'DisplayName',['Starting Point ','(',num2str(x0_p3(1)),', ',num2str(x0_p3(2)),')'])
hold off
grid on, xlabel('k'), ylabel('max(f1(k),f2(k))')
legend('show')

% create right plot for 3d visualisation of 2d newton's method
subplot (3,2,[2 4 6])
x3d = -3:0.1:3;
y3d = -3:0.1:3;
[X,Y] = meshgrid(x3d,y3d);
for i = 1:length(x3d);
    for j = 1:length(y3d);
        F1(j,i)=func([x3d(i);y3d(j)],1);
        F2(j,i)=func([x3d(i);y3d(j)],2);
    end
end

C1 = F1;
C2 = F2;
s1 = surf(X,Y,F1,C1,'FaceAlpha',0.8)
hold on
s2 = surf(X,Y,F2,C2,'FaceAlpha',0.8)
set(s1, 'edgecolor','none');
set(s2, 'edgecolor','none');
plot3(xn_p1(1,:),xn_p1(2,:),y1f1(:),'m-o')
plot3(xn_p2(1,:),xn_p2(2,:),y2f1(:),'g-o')
plot3(xn_p3(1,:),xn_p3(2,:),y3f1(:),'k-o')
plot3(xn_p1(1,:),xn_p1(2,:),y1f2(:),'m-o')
plot3(xn_p2(1,:),xn_p2(2,:),y2f2(:),'g-o')
plot3(xn_p3(1,:),xn_p3(2,:),y3f2(:),'k-o')
hold off
rotate3d on