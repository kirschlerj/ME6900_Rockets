
% ME 6900 Project 3 - Problem 1
clear, clc, close all

h0  = 0; 
v0  = 200; 
tf  = 42;    

[t,x] = ode45(@ode, [0,tf], [h0, v0]);

hMax   = max(x(:,1));
tZeroH = t(x(:,1)<=0);

figure;
yyaxis left
plot(t, x(:,1))
ylabel('Vertical Position [m]')
yyaxis right
plot(t, x(:,2))
ylabel('Velocity [m/s]')
hold on
plot(t(hMax == x(:,1)), hMax,'.', 'color', "#0072BD", 'MarkerSize', 25)
xlim([0,42]);
xlabel('Time [s]')
title('Ball Vertical Position and Velocity vs. Time')
legend({'Position','Velocity','Max Height = 2038.7m'})
saveas(gcf, 'Figures/P1ball.png');


function dxdt = ode(t,x)
    dx = x(2);
    dv = -9.81;
    dxdt = [dx; dv];
end 


