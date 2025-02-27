
% ME 6900 Project 3 - Problem 1
clear, clc, close all

h0  = 0; 
v0  = 200; 
tf  = 42;    

[t,x] = ode45(@ode, [0:1:tf], [h0, v0]);

hMax   = max(x(:,1));
tZeroH = roots([-4.905 200 0]);

figure;
yyaxis left
plot(t, x(:,1))
ylabel('Vertical Position [m]')
yyaxis right
plot(t, x(:,2))
ylabel('Velocity [m/s]')
hold on
plot(t(hMax == x(:,1)), hMax,'.', 'color', "#0072BD", 'MarkerSize', 25)
hold on
plot(tZeroH(2), 0, 'r.', 'MarkerSize', 25)
xlim([0,42]);
xlabel('Time [s]')
title('Ball Vertical Position and Velocity vs. Time')
legend({'Position','Velocity',sprintf('Max Height = %.1fm', hMax),...
        sprintf('Impact = %.1fs', tZeroH(2))}, 'Location', 'southoutside')
saveas(gcf, 'Figures/(P1)ball.png');

fprintf('Time till impact: %s [s]',tZeroH(2))

figure(2)
xlim([0,43])
ylim([0,2200])
xlabel('Time [s]')
ylabel('Vertical Position [m]')
hold on
pause(10)
for i=1:1:length([0:1:tf])
    pause(0.5)
    scatter(t(i), x(i,1), 'r')
    
end

function dxdt = ode(t,x)
    dx = x(2);
    dv = -9.81;
    dxdt = [dx; dv];
end 


