%% Task 2 - Iterative Algorithm Comparison

% clear workspace
clear
clc

% Initialisation 
tol = 1.0e-4;  % tolerance for asserts
nmax = 20;     % maximum number of iterations

% functions to test algorithms on
f1 = @(x) x.^2 - 1;                           % function 1
g1 = @(x) 2*x;                                % gradient 1
f2 = @(x) (exp(x)-exp(-x))./(exp(x)+exp(-x)); % function 2
g2 = @(x) 4*exp(2*x)./(exp(2*x)+1).^2;        % gradient 2
f3 = @(x) cos(x)+sin(x.*x)-0.5;               % function 3
g3 = @(x) 2*x.*cos(x.*x)-sin(x);              % gradient 3
% initial root estimates for each function
% column 1: x0 for initial bracket methods
% column 2: x1 for initial bracket methods
% column 3: x0 for Newton's method
xint1 = ([-3.0,0.5,-3.0]);
xint2 = ([-5.,2.,1.1]);
xint3 = ([-2.0,1.5,-0.40]);

% function titles for plots
title1 = 'f(x)=x^2-1';
title2 = 'f(x)=(e^x - e^{-x})/(e^x + e^{-x})';
title3 = 'f(x)=cos(x)+sin(x^2)';

% set to false when you don't need to produce plot of functions
disp_func = true;
if disp_func
	x = linspace(-5.,5.,1000);
    figure(1), clf
    subplot(3,1,1)
    plot(x,f1(x))
    grid on, xlabel('x'), ylabel('f(x)'), title(title1)
    subplot(3,1,2)
    plot(x,f2(x))
    grid on, xlabel('x'), ylabel('f(x)'), title(title2)
    subplot(3,1,3)
    plot(x,f3(x))
    grid on, xlabel('x'), ylabel('f(x)'), title(title3)
    %pause
end


%% To do - complete below function calls
% bisection method
xbf1 = Bisection(f1, xint1(1), xint1(2), nmax, tol);
xbf2 = Bisection(f2, xint2(1), xint2(2), nmax, tol);
xbf3 = Bisection(f3, xint3(1), xint3(2), nmax, tol);

% secant method
xsf1 = Secant(f1, xint1(1), xint1(2), nmax, tol);
xsf2 = Secant(f2, xint2(1), xint2(2), nmax, tol);
xsf3 = Secant(f3, xint3(1), xint3(2), nmax, tol);

% regula falsi method
xrf1 = Regulafalsi(f1, xint1(1), xint1(2), nmax, tol);
xrf2 = Regulafalsi(f2, xint2(1), xint2(2), nmax, tol);
xrf3 = Regulafalsi(f3, xint3(1), xint3(2), nmax, tol);

% newton's method
xnf1 = Newton(f1, g1, xint1(3), nmax, tol);
xnf2 = Newton(f2, g2, xint2(3), nmax, tol);
xnf3 = Newton(f3, g3, xint3(3), nmax, tol);

% combined bisection/newtons method
xcf1 = Combined(f1, g1, xint1(1), xint1(2), nmax, tol);
xcf2 = Combined(f2, g2, xint2(1), xint2(2), nmax, tol);
xcf3 = Combined(f3, g3, xint3(1), xint3(2), nmax, tol);


%% start figure for method root convergence comparison
figure(2), clf

% create top plot for function 1
subplot(1,3,1)
plot(linspace(1,length(xbf1),length(xbf1)),xbf1,'m-o', 'DisplayName',['Bisection ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
hold on
plot(linspace(1,length(xsf1),length(xsf1)),xsf1,'b--o', 'DisplayName',['Secant ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
plot(linspace(1,length(xrf1),length(xrf1)),xrf1,'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
plot(linspace(1,length(xnf1),length(xnf1)),xnf1,'r-.o', 'DisplayName',['Newton ','(',num2str(xint1(3)),')'])
plot(linspace(1,length(xcf1),length(xcf1)),xcf1,'g--o', 'DisplayName',['Combined ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
hold off
grid on, xlabel('k'), ylabel('x(k)'), title(title1)
legend('show')

% create middle plot for function 2
subplot(1,3,2)
plot(linspace(1,length(xbf2),length(xbf2)),xbf2,'m-o', 'DisplayName',['Bisection ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
hold on
plot(linspace(1,length(xsf2),length(xsf2)),xsf2,'b--o', 'DisplayName',['Secant ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
plot(linspace(1,length(xrf2),length(xrf2)),xrf2,'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
plot(linspace(1,length(xnf2),length(xnf2)),xnf2,'r-.o', 'DisplayName',['Newton ','(',num2str(xint2(3)),')'])
plot(linspace(1,length(xcf2),length(xcf2)),xcf2,'g--o', 'DisplayName',['Combined ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
hold off
grid on, xlabel('k'), ylabel('x(k)'), title(title2)
legend('show','Location','southeast')

% create bottom plot for function 3
subplot(1,3,3)
plot(linspace(1,length(xbf3),length(xbf3)),xbf3,'m-o', 'DisplayName',['Bisection ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
hold on
plot(linspace(1,length(xsf3),length(xsf3)),xsf3,'b--o', 'DisplayName',['Secant ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
plot(linspace(1,length(xrf3),length(xrf3)),xrf3,'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
plot(linspace(1,length(xnf3),length(xnf3)),xnf3,'r-.o', 'DisplayName',['Newton ','(',num2str(xint3(3)),')'])
plot(linspace(1,length(xcf3),length(xcf3)),xcf3,'g--o', 'DisplayName',['Combined ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
hold off
grid on, xlabel('k'), ylabel('x(k)'), title(title3)
legend('show','Location','southeast')

%% end figure for method performance comparison

%% start figure for method performance comparison
figure(3), clf

% create top plots for function 1
subplot(3,2,1)
plot(linspace(1,length(xbf1),length(xbf1)),f1(xbf1),'m-o', 'DisplayName',['Bisection ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
hold on
plot(linspace(1,length(xsf1),length(xsf1)),f1(xsf1),'b--o', 'DisplayName',['Secant ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
plot(linspace(1,length(xrf1),length(xrf1)),f1(xrf1),'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
plot(linspace(1,length(xnf1),length(xnf1)),f1(xnf1),'r-.o', 'DisplayName',['Newton ','(',num2str(xint1(3)),')'])
plot(linspace(1,length(xcf1),length(xcf1)),f1(xcf1),'g--o', 'DisplayName',['Combined ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
hold off
grid on, xlabel('k'), ylabel('f(x)'), title(title1)
legend('show')

subplot(3,2,2)
semilogy(linspace(1,length(xbf1),length(xbf1)),abs(f1(xbf1)),'m-o', 'DisplayName',['Bisection ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
hold on
semilogy(linspace(1,length(xsf1),length(xsf1)),abs(f1(xsf1)),'b--o', 'DisplayName',['Secant ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
semilogy(linspace(1,length(xrf1),length(xrf1)),abs(f1(xrf1)),'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
semilogy(linspace(1,length(xnf1),length(xnf1)),abs(f1(xnf1)),'r-.o', 'DisplayName',['Newton ','(',num2str(xint1(3)),')'])
semilogy(linspace(1,length(xcf1),length(xcf1)),abs(f1(xcf1)),'g--o', 'DisplayName',['Combined ','(',num2str(xint1(1)),', ',num2str(xint1(2)),')'])
hold off
grid on, xlabel('k'), ylabel('|f(x)|'), title(title1)
legend('show')

% create middle plots for function 2
subplot(3,2,3)
plot(linspace(1,length(xbf2),length(xbf2)),f2(xbf2),'m-o', 'DisplayName',['Bisection ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
hold on
plot(linspace(1,length(xsf2),length(xsf2)),f2(xsf2),'b--o', 'DisplayName',['Secant ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
plot(linspace(1,length(xrf2),length(xrf2)),f2(xrf2),'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
plot(linspace(1,length(xnf2),length(xnf2)),f2(xnf2),'r-.o', 'DisplayName',['Newton ','(',num2str(xint2(3)),')'])
plot(linspace(1,length(xcf2),length(xcf2)),f2(xcf2),'g--o', 'DisplayName',['Combined ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
hold off
grid on, xlabel('k'), ylabel('f(x)'), title(title2)
legend('show','Location','southeast')

subplot(3,2,4)
semilogy(linspace(1,length(xbf2),length(xbf2)),abs(f2(xbf2)),'m-o', 'DisplayName',['Bisection ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
hold on
semilogy(linspace(1,length(xsf2),length(xsf2)),abs(f2(xsf2)),'b--o', 'DisplayName',['Secant ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
plot(linspace(1,length(xrf2),length(xrf2)),abs(f2(xrf2)),'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
semilogy(linspace(1,length(xnf2),length(xnf2)),abs(f2(xnf2)),'r-.o', 'DisplayName',['Newton ','(',num2str(xint2(3)),')'])
semilogy(linspace(1,length(xcf2),length(xcf2)),abs(f2(xcf2)),'g--o', 'DisplayName',['Combined ','(',num2str(xint2(1)),', ',num2str(xint2(2)),')'])
hold off
grid on, xlabel('k'), ylabel('|f(x)|'), title(title2)
legend('show','Location','southeast')

% create bottom plots for function 3
subplot(3,2,5)
plot(linspace(1,length(xbf3),length(xbf3)),f3(xbf3),'m-o', 'DisplayName',['Bisection ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
hold on
plot(linspace(1,length(xsf3),length(xsf3)),f3(xsf3),'b--o', 'DisplayName',['Secant ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
plot(linspace(1,length(xrf3),length(xrf3)),f3(xrf3),'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
plot(linspace(1,length(xnf3),length(xnf3)),f3(xnf3),'r-.o', 'DisplayName',['Newton ','(',num2str(xint3(3)),')'])
plot(linspace(1,length(xcf3),length(xcf3)),f3(xcf3),'g--o', 'DisplayName',['Combined ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
hold off
grid on, xlabel('k'), ylabel('f(x)'), title(title3)
legend('show','Location','southeast')

subplot(3,2,6)
semilogy(linspace(1,length(xbf3),length(xbf3)),abs(f3(xbf3)),'m-o', 'DisplayName',['Bisection ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
hold on
semilogy(linspace(1,length(xsf3),length(xsf3)),abs(f3(xsf3)),'b--o', 'DisplayName',['Secant ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
semilogy(linspace(1,length(xrf3),length(xrf3)),abs(f3(xrf3)),'k:o', 'DisplayName',['Regula Falsi ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
semilogy(linspace(1,length(xnf3),length(xnf3)),abs(f3(xnf3)),'r-.o', 'DisplayName',['Newton ','(',num2str(xint3(3)),')'])
semilogy(linspace(1,length(xcf3),length(xcf3)),abs(f3(xcf3)),'g--o', 'DisplayName',['Combined ','(',num2str(xint3(1)),', ',num2str(xint3(2)),')'])
hold off
grid on, xlabel('k'), ylabel('|f(x)|'), title(title3)
legend('show','Location','southwest')
%% end figure for method performance comparison

