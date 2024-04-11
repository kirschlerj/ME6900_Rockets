
% ME 6900 Project 4 - Missile Guidance (A2A, AIM-54)
clear, clc, close all

% Constants
c = 343;
dt = 0.1;
tSim = 30;
tBurn = 20.6;
N = 5;

% Initial Conditions
tv0     = 1.2*c;     
ty0     = 13000;  
tx0     = 0;      
tth0    = 0; 
mv0     = 4.3*c;       
mx0     = -5000;  
my0     = 14000;  
mth0    = 0;
th0     = (atan2((ty0-my0),(tx0-mx0)));
vc0     = sqrt((mv0*cosd(mth0) + tv0*cosd(tth0))^2 + (mv0*sind(mth0) + tv0*sind(tth0))^2);

% ODE Solver
[t, x] = ode45(@(t,x) guide(t, x, N), [0:dt:tSim],[tv0; tx0; ty0; tth0; mv0; mx0; my0; mth0; th0; vc0]);
 
% Plotting
figure;
plot(x(:,2), x(:,3))
hold on
plot(x(:,6), x(:,7))
title('Flight Profile')
saveas(gcf, 'Figures/P4Trajectories.png');


function [dxdt] = guide(t, x, N)

mvx = x(5)*cosd(x(8));
mvy = x(5)*sind(x(8));
mx = x(6);
my = x(7);
mth = x(8);

tx = x(2);
ty = x(3);
tdx = x(1)*cosd(x(4));
tdy = x(1)*sind(x(4));
tdth = x(4);
tdv = 0;
tvx = tdx;
tvy = tdy;

X  = tx-mx;
Y  = ty-my;
R  = sqrt(X^2-Y^2);
th = x(9);
thn = (atan2(Y,X));
dth = thn-th;

vc = x(10);
vcn  = sqrt((mvx + tvx)^2 + (mvy + tvy)^2);
dvc = vcn-vc;
a = N*dth*vc;

mdth = a*5;
mdx = x(5)*cos(mth);
mdy = x(5)*sin(mth);
mdv = 0;

dxdt = [tdv; tdx; tdy; tdth; mdv; mdx; mdy; mdth; dth; dvc];
end 


