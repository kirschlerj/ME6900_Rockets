
% ME 6900 Project 3 - Problem 2
clear, clc, close all

% Constants
thrustAvg = 174000; %(N)
tBurn     = 250;    %(s)
tSim      = 100;    
mdot      = 1.154;  %(kg/s)
area      = 0.5;    %(m^2)

% Initial Conditions
v0        = 0;      %(m/s)
m0        = 1167.2; %(kg)
h0        = 0;      %(m)
thrust0   = 174000; %(N)


for i = 1:20            %this is just for testing
    v(i) = i*i;
    alt(i) = i*5000;

    [rho(i), c(i)] = atmosmodel(alt(i));
    cd(i) = cd_interp(v(i),c(i));
    fd(i) = drag(rho(i),v(i),cd(i), area);

end 


% [t,x] = ode45(@flight, [0,tf], [h0, v0]);
% 
% 
% function dxdt = flight(t,x)
%     dx = x(2);
%     dv = -9.81;
%     dxdt = [dx; dv];
% end 