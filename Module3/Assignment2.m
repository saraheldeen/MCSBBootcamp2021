% Project Julia

clear all
clc
close all
% How much caffeine is there in the jar?

% n - number of days
% x - fraction of caffeinated

nMax = 100; % max number of months to simulate

N = 10; % number of scoops in each jar
x = zeros(1,nMax); % fraction caffeinated
x1 = zeros(1,nMax);
x2 = zeros(1,nMax);
x3 = zeros(1,nMax);
%x(1) = 1.0; % initial fraction caffeinated
r = 0.1; % Constant
k = 0.6; % Constant

%% Specify initial values of x and y
x(1) = 0.2;
x1(1) = 0;
x2(1) = 0.1;
x3(1) = 0.3;
%% Create the vectors
for n=1:nMax-1
    
    x(n+1) = x(n) + (r*(1-(1/k)*x(n)))*x(n);
    x1(n+1) = x1(n) + (r*(1-(1/k)*x1(n)))*x1(n);
    x2(n+1) = x2(n) + (r*(1-(1/k)*x2(n)))*x2(n);
    x3(n+1) = x3(n) + (r*(1-(1/k)*x3(n)))*x3(n);
end


%% Part c

figure(1);
plot(x,'-ok')
hold on
plot(x1,'-or')
plot(x2,'-ob') 
plot(x3,'-og')
ylabel('$X(n)$', 'interpreter','latex')
xlabel('Months', 'interpreter','latex')
title('Rabbit Population Model','interpreter','latex')
legend('x(1) = 0.2','x(1) = 0','x(1) = 0.1','x(1) = 0.3','interpreter','latex')

%% Change r
r = 2.49;
% Specify initial values of x and y
x(1) = 0.2;
% x1(1) = 0;
% x2(1) = 0.1;
% x3(1) = 0.3;
% Create the vectors
for n=1:nMax-1
    
    x(n+1) = x(n) + (r*(1-(1/k)*x(n)))*x(n);
%     x1(n+1) = x1(n) + (r*(1-(1/k)*x1(n)))*x1(n);
%     x2(n+1) = x2(n) + (r*(1-(1/k)*x2(n)))*x2(n);
%     x3(n+1) = x3(n) + (r*(1-(1/k)*x3(n)))*x3(n);
end

% Part c

figure(2);
plot(x,'-ok')
hold on
% plot(x1,'-or')
% plot(x2,'-ob') 
% plot(x3,'-og')
ylabel('$X(n)$', 'interpreter','latex')
xlabel('Months', 'interpreter','latex')
title('Rabbit Population Model','interpreter','latex')
legend('x(1) = 0.2','x(1) = 0','x(1) = 0.1','x(1) = 0.3','interpreter','latex')
hold off

%%  Part g
k = 0.6;
nMax = 1000;
clear x
x = zeros(1,nMax);
x(1) = 0.2;
figure
for r = 0:0.01:3
    
    
    for n=1:nMax-1
        
        x(n+1) = x(n) + (r*(1-(1/k)*x(n)))*x(n);
        
    end
    %if  length (x) > 500 %r == 0 || r > 2
        plot(r,x(500:end),'.')
        hold on
    %end
    %legend ('r = 0','r=1','r = 2','r =3','interpreter','latex')
end
ylabel('$X(n)$', 'interpreter','latex')
xlabel('r', 'interpreter','latex')
hold off









