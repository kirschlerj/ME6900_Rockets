
% ME 6900 Project 4 - Missile Guidance (A2A, AIM-54)
clear, clc, close all

% Constants
c = 343;
dt = 0.1;
tSim = 100;
N = 5;

% Initial Conditions
tv0     = 1.2*c;     
ty0     = 13000;  
tx0     = 0;      
thead0  = 0; 
mv0     = 1.5*c;       
mx0     = -5000;  
my0     = 12000;  
launch_ang = 0;
th0     = rad2deg(atan2((ty0-my0),(tx0-mx0)));
vc0     = sqrt((mv0*cosd(launch_ang) + tv0*cosd(thead0))^2 + (mv0*sind(launch_ang) + tv0*sind(thead0))^2);

% ODE Solver
[t, x] = ode45(@(t,x) guide(t, x, dt, N), [0:dt:tSim],[tv0; tx0; ty0; thead0; mv0; mx0; my0; launch_ang; th0; vc0]);
 


% Plotting
figure;
plot(x(:,2), x(:,3))
hold on
plot(x(:,6), x(:,7))
title('Flight Profile')
saveas(gcf, 'Figures/P4Trajectories.png');



function [dxdt] = guide(t, x, dt, N)

tdv = 0;
tdhead = x(4);
tdx = x(1)*cosd(x(4));
tdy = x(1)*sind(x(4));

tx = x(2);
ty = x(3);
mx = x(6);
my = x(7);
X  = tx-mx;
Y  = ty-my;
R  = sqrt(X^2-Y^2);
th = x(9);
thn = rad2deg(atan2(Y,X));
dth = thn-th;

tvx = tdx;
tvy = tdy;
mvx = x(5)*cosd(x(8));
mvy = x(5)*sind(x(8));
vc = x(10);
vcn  = sqrt((mvx + tvx)^2 + (mvy + tvy)^2);
dvc = vcn-vc;
a = N * deg2rad(dth) * vc

mth = x(8);
mdth = a;
mdx = x(5)*cosd(mth);
mdy = x(5)*sind(mth);

mdv = 0;


    dxdt = [tdv; tdx; tdy; tdhead; mdv; mdx; mdy; mdth; dth; dvc];
end 


