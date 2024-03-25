% ME 6900 Project 3 - Problem 3
clear, clc, close all

% Constants
tBurn     = 400;    %(s)
tSim      = 400;    
mdot      = -1.154;  %(kg/s)
area      = 0.5;    %(m^2)

% Initial Conditions
v0        = 1;      % Initial velocity (m/s)
h0        = 0;      % Initial altitude (m)
x0        = 0;      % Initial hor. pos.(m)
m0        = 1167.2; % Initial mass (kg)
fd0       = 0;      % Initial drag force (N)
cd0       = 0;      % Initial drag coefficient
c0        = 0;      % Initial speed of sound (m/s)
rho0      = 0;      % Initial air density (kg/m^3)
th0       = 89;     % Initial body angle (deg)

% ODE Solver
[t, x] = ode45(@(t,x) flight(t, x, mdot, tBurn), [0, tSim], [h0; v0; m0; x0; th0;]);

% for i = 1:length(t)
%     [~, fd(i), rho(i), cd(i), c(i), T(i)] = flight(t(i), x(i,:), mdot, tBurn);
% end
% 
% 
% fd   = fd';
% rho  = rho';
% cd   = cd';
% c    = c';
% mach = vel./c;
alt  = x(:,1);
vel  = x(:,2);
m    = x(:,3);
hor  = x(:,4);
th   = x(:,5);


figure;
yyaxis left
plot(t, alt)
ylabel('Altitude [m]')
yyaxis right
plot(t, mach)
ylabel('Mach Number [-]');
xlabel('Time [s]')
title('Flight Profile')
saveas(gcf, 'Figures/P2FlightProfile.png');

figure;
plot(hor, alt)
xlabel('Horizontal Position [m]')
ylabel('Vertical Position [m]')
grid on
title('Rocket Heading')
saveas(gcf, 'Figures/heading.png');

function [dxdt, fd, rho, cd, c, T] = flight(t, x, mdot, tBurn)
    
    T = 40000;
    A = 0.5;
    g = 9.81;

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
    dv = (T - fd) / m - g*sind(th);
    dth = -(g*cosd(th))/v; 
    dxdt = [dh; dv; dm; dx; dth;];
 
end 

