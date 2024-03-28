
% ME 6900 Project 3 - Problem 2
clear, clc, close all

% Constants
tBurn     = 130;    %(s)
tSim      = 388;    
mdot      = -1.154;  %(kg/s)

% Initial Conditions
v0        = 0;      % Initial velocity (m/s)
h0        = 0;      % Initial altitude (m)
m0        = 1167.2; % Initial mass (kg)

% ODE Solver
[t, x] = ode45(@(t,x) flight(t, x, mdot, tBurn), [0:2:tSim], [h0; v0; m0;]);

for i = 1:length(t)
    [~, fd(i), rho(i), cd(i), c(i), T(i)] = flight(t(i), x(i,:), mdot, tBurn);
end

fd = fd';
rho = rho';
cd = cd';
c = c';
T = T';
alt = x(:,1);
vel = x(:,2);
m   = x(:,3);
mach = vel./c;


figure;
yyaxis left
plot(t, alt)
ylabel('Altitude [m]')
yyaxis right
plot(t, vel)
ylabel('Velocity [m/s]');
xlabel('Time [s]')
title('Flight Profile')
saveas(gcf, 'Figures/P2FlightProfile.png');

figure; 
plot(t, T, t, fd, t, T+fd);
ylabel('Force [N]');
xlabel('Time [s]')
title('Body Forces')
legend('Thrust','Drag','Total')
saveas(gcf, 'Figures/P2BodyForces.png');

figure;
plot(t, m);
ylabel('Mass [kg]');
xlabel('Time [s]');
title('Rocket Mass vs Time');
saveas(gcf, 'Figures/P2Mass.png');

figure;
plot(t, x(:,2));
ylabel('Acceleration [m/s^2]');
xlabel('Time [s]');
title('Acceleration vs Time');
saveas(gcf, 'Figures/P2accel.png');

% figure(1)
% xlim([0,388])
% ylim([0,700000])
% xlabel('Time [s]')
% ylabel('Vertical Position [m]')
% hold on
% pause(10)
% for i=1:1:length([0:2:tSim])
%     pause(0.1)
%     scatter(t(i), x(i,1), 'r')
%     
% end

function [dxdt, fd, rho, cd, c, T] = flight(t, x, mdot, tBurn)

    T = 52000;
    A = 0.5;

    h = x(1); 
    v = x(2);
    m = x(3);
      
    [rho, c] = atmosmodel(h);
    cd = cd_interp(v,c);
    fd = drag(rho,v,cd,A);
    
    if t >= tBurn
        dm = 0;
        T = 0;
    else 
        dm = mdot;
    end 
    
    dh = x(2);
    dv = (T + fd) / m - 9.81;
    dxdt = [dh; dv; dm;];
 
end 


    