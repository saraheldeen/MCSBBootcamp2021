clc
clear all
close all

% parameters
a = 2; %-1; %-1 %0 %-1;
b = 1; %-1;  %-2%-2 %-2;
d = 4; %-1; %0 %1 %1;
c = 5; % repulsion no spiral%-1; % attraction no spiral %2 Part d saddle point  %2% Part repulsive spiral  %2; % solution for part 5

% to exlode + 5 u 
% to attract - 5 u


% model equations
f =@(x,y) a*x + b*y; 
g =@(x,y) c*x + d*y;

[T, X] = ode45(@(t,x)[f(x(1),x(2));g(x(1),x(2))], [0,1000], [.1,.1] );

figure; hold on;
set(gca, 'xlim', [-1, 1], 'ylim', [-1, 1])
ylabel('x');
xlabel('y')

xArray = linspace(-1,1,16);
yArray = linspace(-1,1,16);

[xMesh,yMesh] = meshgrid(xArray, yArray);

% the Matlab plot command for a field of arrows is:
quiver(xMesh, yMesh, f(xMesh, yMesh), g(xMesh,yMesh))

plot(X(:,1),X(:,2),'-r')
plot(X(end,1),X(end,2), 'or')