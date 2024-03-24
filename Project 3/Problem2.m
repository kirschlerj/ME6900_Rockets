
% ME 6900 Project 3 - Problem 2
clear, clc, close all

% Constants
thrustAvg = 174000; %(N)
tBurn     = 250;    %(s)
tSim      = 100;    
mdot      = -1.154;  %(kg/s)
area      = 0.5;    %(m^2)

% Initial Conditions
v0        = 0;      % Initial velocity (m/s)
h0        = 0;      % Initial altitude (m)
m0        = 1167.2; % Initial mass (kg)
fd0       = 0;      % Initial drag force (N)
cd0       = 0;      % Initial drag coefficient
c0        = 0;      % Initial speed of sound (m/s)
rho0      = 0;      % Initial air density (kg/m^3)

[t, x] = ode45(@(t,x) flight(t, x, mdot), [0, tSim], [h0; v0; m0;]);
alt = x(:,1);
vel = x(:,2);
m   = x(:,3);


figure
plot(t, vel)

function [dxdt, dm, fd] = flight(t, x, mdot)
    
    T = 174000;
    A = 0.5;

    h = x(1); 
    v = x(2);
    m = x(3);
      
    [rho, c] = atmosmodel(h);
    cd = cd_interp(v,c);
    fd = drag(rho,v,cd,A);
    
    dh = x(2);
    dm = mdot;
    dv = (T - fd) / m - 9.81;
    dxdt = [dh; dv; dm;];
 
end 


    