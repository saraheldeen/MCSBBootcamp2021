clc
clear all
close all

% define ODE and parameters
a_0 = 500; % molecules per hour
a_1 = 0.5; % molecules per hour, per existing molecule of A
b = 4; % 1/hrs
dPdt =@(P) (a_0 + a_1*P) - b*P;

% Find the steady state by plotting the dP/dt versus P
PArray = linspace(0,300,300);
dPdtPhaseLine = dPdt(PArray);
figure;
plot(PArray,dPdtPhaseLine,'r');
ylabel('dP/dt');
xlabel('P');
refline(0,0); % horizontal line at dPdt=0
legend('dP/dt Phase Line','reference line');

% Find the steady state symbolically ("pencil and paper")
% Set dp/dt to zero then solve for P value
% P = a0/(b-a)
% Find the steady state by simulating the ODE

%%
figure
[T, P] = ode45(@(t,x)dPdt(x), [0,3.0], 0);
plot(T,P);

ylabel('P Concentration','Interpreter','latex');
xlabel('Time (hours)','Interpreter','latex');
% get derivative of p
ax = gca;
set(gca,'TickLabelInterpreter','latex')
ax.FontSize = 18;
%%
dP = diff(P)./diff(T);
figure
plot (T(1:end-1), dP)
ylabel('dP/dt');
xlabel('Time (hours)');



