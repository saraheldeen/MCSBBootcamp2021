clc
clear all
close all

% parameters
KaN = 10;
KaF = 10;
KiN = 10;
KiF = 10;
Kicat = 10;
Kacat = 100;
ptot = 1;


for ktot = [10^-3 10^-2 10^-1 0 10 100 1000]
% model equations 
f =@(z, w, y, u) -KaN*(ptot - y)*z + KaF*y+ Kacat*u; 
g =@(z, w, y, u) -KiN*(ktot - u)*w + KiF*u+ Kicat*y;
v =@(z, w, y, u) +KaN*(ptot - y)*z - KaF*y - Kicat*y; 
s =@(z, w, y, u) +KiN*(ktot - u)*w - KiF*u - Kacat*u;

[T, X] = ode45(@(t,x)[f(x(1),x(2),x(3), x(4));...
                      g(x(1),x(2),x(3), x(4));...
                      v(x(1),x(2),x(3), x(4));...
                      s(x(1),x(2),x(3), x(4));],...
                      [0,100] , [0, 1, 0 , 0]);
                  
x = [0:1:length(X)];
x = x.';
semilogx(x(1:end-1),X(:,1),'o')
hold all 
legend
ylabel('[Kinase] uM');
xlabel('A')
                  
end
%%