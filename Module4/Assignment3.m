% ------------------------------------------------------
clc
close all
clear all

A     = 1.1; % fluorescence intensity units
omega = 2.6; % rad/s
A_0   = 0.01;

u=@(t) A*sin(omega*t)+A_0;
tArray = linspace(0,1.6,200);
uArray = u(tArray); % an array of samples of u
% ------------------------------------------------------
% analytical solutions (in real life, we might not know these)
dudtExact      =  A*omega*cos(omega*tArray);
du2dt2Exact    = -A*omega^2*sin(omega*tArray);
du3dt3Exact    = -A*omega^3*cos(omega*tArray);
%%
% Take the sample and add a bit of noise
for i = [1e-4 1e-5 1e-6 1e-7 1e-8]
 uObserved = u(tArray) + (i)*randn(size(tArray));

% create finite-difference derivatives for first derivative, second derivative and third derivative
dudt   = diff(uObserved)./diff(tArray);
du2dt2 = diff(dudt)./diff(tArray(1:end-1));
du3dt3 = diff(du2dt2)./diff(tArray(1:end-2));

% and plot them
figure;
subplot(3,1,1); hold on;
plot(tArray(1:end-1), dudt);
plot(tArray, dudtExact, '-r');
xlabel('t');
ylabel('dudt');

subplot(3,1,2); hold on;
plot(tArray(1:end-2), du2dt2);
plot(tArray, du2dt2Exact, '-r');
xlabel('t');
ylabel('du2dt2')

subplot(3,1,3); hold on;
plot(tArray(1:end-3), du3dt3);
plot(tArray, du3dt3Exact, '-r');
xlabel('t');
ylabel('du3dt3')

percent1 = abs(dudtExact(1:end-1)-dudt);
percent2 = abs(du2dt2Exact(1:end-2)-du2dt2);
percent3 = abs(du3dt3Exact(1:end-3)-du3dt3);

err1 = max(percent1)/max(dudtExact)*100;
err2 = max(percent2)/max(du2dt2Exact)*100;
err3 = max(percent3)/max(du3dt3Exact)*100;

display (i)
display (err1)
display (err2)
display (err3)
end
% compute the difference at the peak between the exact derivative and the
% derivaive of the data 
% tell MATLAB to find the maximum value in that matrix 















