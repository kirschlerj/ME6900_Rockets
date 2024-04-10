
% ME 6900 Project 4 - Missile Guidance (A2A, AIM-54)
clear, clc, close all

% Constants
c = 343;
dt = 0.1;
tSim = 100;

% Initial Conditions
tv0     = 1.2*c;     
ty0     = 13000;  
tx0     = 0;      
thead0  = 0;       
mhead0  = 0;       
mx0     = -5000;  
my0     = 13000;  
mv0     = 1*c;     
mvx0    = mv0*cosd(mhead0);
mvy0    = mv0*sind(mhead0);
launch_ang = 0;     
th0        = 0;
vc0        = sqrt((mvx0 + tv0*cosd(thead0))^2 + (mvy0 + tv0*sind(thead0))^2);

% ODE Solver
[t, x] = ode45(@(t,x) guide(t, x, vc0), [0:dt:tSim],...
        [tv0; tx0; tz0; mx0; mz0; mv0; mvx0; mvy0; th0; thead0; mhead0;]);
 
for i = 1:length(t)
    [~,R(i), vc(i), a(i)] = guide(t(i), x(i,:), vc0);
end



function [dxdt, R, vc, a] = guide(t, x, vc)

    a = 3*x(7)*vc;
    tdv = 0;
    tdx = x(1)*cosd(x(8));
    tdz = x(1)*sind(x(8));
    tdh = 0;
    
    mdx = x(6)*cosd(x(9));
    mdz = x(6)*sind(x(9));
    mdh = x(9) + a/10;
    
    R = sqrt((x(2) - x(4))^2 + (x(3) - x(5))^2);
    dth = (rad2deg(atan2(x(3) - x(5),x(2) - x(4))));
    vc = sqrt((mdx + tdx)^2 + (mdz + tdz)^2);
    
    
    
    
    dxdt = [tdv; tdx; tdz; mdx; mdz; mdv; mdvx; mdvy dth; tdh; mdh;];
end 


