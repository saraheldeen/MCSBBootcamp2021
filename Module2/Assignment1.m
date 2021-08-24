% Project Julia

clear all
clc
close all
% How much caffeine is there in the jar?

% n - number of days
% x - fraction of caffeinated 

nMax = 22; % max number of days to simulate

N = 10; % number of scoops in each jar
x = zeros(1,nMax); % fraction caffeinated
y = zeros(1,nMax);
%x(1) = 1.0; % initial fraction caffeinated
c = -0.8; % Constant 
d = 0.156; % Constant

%% Specify initial values of x and y
x(1) = 0.1;
y(1) = 0.1; 
%% Create the vectors
for n=1:nMax-1
    x(n+1) = (x(n)^2 - y(n)^2)+c;
    %x(n) = x(n-1) - 1/N*x(n-1);
    y(n+1) = 2*x(n)*y(n) + d;
end


%% Part c

figure(1); 
plot(x,'-ok');
ylabel('x')
xlabel('n')


figure(2); 
plot(x,y,'-ok');
ylabel('y')
xlabel('x')

%%  Part d

xmin = -20;
xmax = 20;
n = 100;
a = xmin+rand(1,n)*(xmax-xmin);
b = xmin+rand(1,n)*(xmax-xmin);

%% Part e

for i = 1:100
    x(i) = a(i);
    y(i) = b(i); 

end



