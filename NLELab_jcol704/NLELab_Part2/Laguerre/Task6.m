%% Task 6 - Laguerre's Method

% clear workspace
clear all
clc

% initialisation
c=[1, -4,0,3,-2,0,5]; % coefficients of polynomial in order of decreasing power
tol = eps(100); % stopping tolerance
max_iter = 100; % maximum number of iterations to find each root
success = true; % status flag

rng(12345) % set the random seed

n=length(c) - 1; % number of roots

x=zeros(n,1); % initialise the vector of roots

for i = 1 :  n % for each root
    % Display current coefficients (after deflation)
    fprintf('\nroot %i: coefficients = [ ', i)
    if all(imag(c) == 0)
        fprintf('%g ', c)
    else
        fprintf('%g%+gi ', [real(c(:)) imag(c(:))].')
    end
    fprintf(']\n')
    
    % Iterate to next root
    [x(i), success] = Laguerre(c, max_iter, tol);
    if ~success
        disp([char(13) 'Laguerre''s method failed']);
        break;
    end
    
    % Deflate most recent root
    [c, rem] = Deflate(c, x(i));
    assert(abs(rem) < tol, 'Non-zero remainder after deflation.')
end

disp([char(13) 'The roots of the polynomial are:']);
disp(x);