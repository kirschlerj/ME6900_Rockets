
% ME 6900 Project 4 - Missile Guidance (A2A, AIM-54)
clear, clc, close all

% Constants
c = 343;
dt = 0.1;
tSim = 100;

% Initial Conditions
tar_v0     = 1.2*c;   %(m/s)   
tar_z0     = 13000;   %(m)
tar_x0     = 0;       %(m)
tar_head0  = 0;       %(deg)
mis_x0     = -5000;   %(m)
mis_z0     = 13000;   %(m)
mis_v0     = 1*c;     %(m/s)
mis_head0  = 0;       %(deg)
launch_ang = 0;       %(deg)
th0        = 0;
vc0        = sqrt((mis_v0*cosd(mis_head0) + tar_v0*cosd(tar_head0))^2 + (mis_v0*sind(mis_head0) + tar_v0*sind(tar_head0))^2);


% ODE Solver
[t, x] = ode45(@(t,x) guide(t, x, vc0), [0:dt:tSim],...
        [tar_v0; tar_x0; tar_z0; mis_x0; mis_z0; mis_v0; th0; tar_head0; mis_head0;]);
 
for i = 1:length(t)
    [~,R(i), vc(i), a(i)] = guide(t(i), x(i,:), vc0);
end



function [dxdt, R, vc, a] = guide(t, x, vc)

    a = 3*x(7)*vc;
    tar_dv = 9.81;
    tar_dx = x(1)*cosd(x(8));
    tar_dz = x(1)*sind(x(8));
    tar_dh = 0;
    
    mis_dv = 0;
    mis_dx = x(6)*cosd(x(9));
    mis_dz = x(6)*sind(x(9));
    mis_dh = x(9) + a/10;
    
    R = sqrt((x(2) - x(4))^2 + (x(3) - x(5))^2);
    dth = (rad2deg(atan2(x(3) - x(5),x(2) - x(4))));
    vc = sqrt((mis_dx + tar_dx)^2 + (mis_dz + tar_dz)^2);
    
    
    
    
    dxdt = [tar_dv; tar_dx; tar_dz; mis_dx; mis_dz; mis_dv; dth; tar_dh; mis_dh;];
end 


