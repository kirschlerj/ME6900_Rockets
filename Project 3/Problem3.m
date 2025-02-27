% ME 6900 Project 3 - Problem 3
clear, clc, close all

% Constants
tBurn     = 150;    %(s)
tSim      = 415;    
mdot      = -1.154;  %(kg/s)

% Initial Conditions
v0        = 1;      % Initial velocity (m/s)
h0        = 0;      % Initial altitude (m)
x0        = 0;      % Initial hor. pos.(m)
m0        = 1167.2; % Initial mass (kg)
th0       = 88;     % Initial body angle (deg)

% ODE Solver
[t, x] = ode45(@(t,x) flight(t, x, mdot, tBurn), [0:2:tSim], [h0; v0; m0; x0; th0;]);

for i = 1:length(t)
    [~, fd(i), rho(i), cd(i), c(i), T(i)] = flight(t(i), x(i,:), mdot, tBurn);
end


fd   = fd';
rho  = rho';
cd   = cd';
c    = c';
T = T';
alt  = x(:,1);
vel  = x(:,2);
m    = x(:,3);
hor  = x(:,4);
th   = x(:,5);
mach = vel./c;

figure;
plot(mach, cd)

figure;
yyaxis left
plot(t, alt)
ylabel('Altitude [m]')
yyaxis right
plot(t, vel)
ylabel('Velocity [m/s]');
xlabel('Time [s]')
title('Flight Profile')
saveas(gcf, 'Figures/P3FlightProfile.png');

figure;
plot(hor, alt)
xlabel('Horizontal Position [m]')
ylabel('Vertical Position [m]')
grid on
title('Rocket Heading')
saveas(gcf, 'Figures/P3heading.png');

figure;
plot(t, th)
xlabel('Time [s]')
ylabel('Heading Angle [deg]')
title('Rocket Angle vs Time')
saveas(gcf, 'Figures/P3Angle.png');

figure; 
plot(t, T, t, fd, t, T+fd);
ylabel('Force [N]');
xlabel('Time [s]')
title('Body Forces')
legend('Thrust','Drag','Total')
saveas(gcf, 'Figures/P3BodyForces.png');

figure;
plot(t, m)
xlabel('Time [s]')
ylabel('Mass [kg]')
title('Rocket Mass vs Time')
saveas(gcf, 'Figures/P3mass.png');

% figure(1)
% xlim([0,180000])
% ylim([0,800000])
% xlabel('Horizontal Position [m]')
% ylabel('Vertical Position [m]')
% hold on
% pause(10)
% for i=1:1:length([0:2:tSim])
%     pause(0.1)
%     scatter(hor(i), alt(i,1), 'r')
%     
% end

function [dxdt, fd, rho, cd, c, T] = flight(t, x, mdot, tBurn)
    
    T = 53000;
    A = 0.5;
    g = 9.81;
    m_cst = 40.1;

    h = x(1); 
    v = x(2);
    m = x(3);
    th = x(5);
        
    [rho, c] = atmosmodel(h);
    cd = cd_interp(v,c);
    fd = drag(rho,v,cd,A);
    
    if t >= tBurn
        dm = 0;
        T = 0;
    else 
        dm = mdot;
    end 
    
    dh = v*sind(th);
    dx = v*cosd(th);
    dv = (T + fd) / m - g*sind(th);
    dth = m_cst*(-(g*cosd(th))/v);
    dxdt = [dh; dv; dm; dx; dth;];
 
end 

