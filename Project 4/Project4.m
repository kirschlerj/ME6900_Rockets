
% ME 6900 Project 4 - Missile Guidance (A2A, AIM-54)
clear, clc, close all

% Constants
c = 343;
tSim = 18.12;
N = 3;

% Initial Conditions
tv0     = 1.2*c;     
ty0     = 13000;  
tx0     = 0;      
thead0  = 0; 
mv0     = 3*c;       
mx0     = -5000;  
my0     = 26000;  
launch_ang = 0;
th0     = (atan2((ty0-my0),(tx0-mx0)));
r0      = sqrt((tx0-mx0)^2 + (ty0-my0)^2);
vc0     = sqrt((mv0*cosd(launch_ang) + tv0*cosd(thead0))^2 + (mv0*sind(launch_ang) + tv0*sind(thead0))^2);

% ODE Solver
[t, x] = ode45(@(t,x) guide(t, x, N), [0 tSim],[tv0; tx0; ty0; thead0; mv0; mx0; my0; launch_ang; th0; vc0]);
 
for i = 1:length(t)
    [~, R(i), dth(i)] = guide(t(i), x(i,:), N);
end 

% Plotting
figure;
plot(x(:,2), x(:,3))
hold on
plot(x(:,6), x(:,7))
xlabel('X Position [m]')
ylabel('Y Position [m]')
title('Flight Profile')
legend('Target Position', 'Missile Position');
saveas(gcf, 'Figures/P4Trajectories.png');

figure;
yyaxis left
plot(t, R')
ylabel('Distance [m]')
yyaxis right
plot(t, x(:,10))
ylabel('Closing Velocity [m/s]');
xlabel('Time [s]')
title('Missile - Target Relations')
saveas(gcf, 'Figures/P4MTRelations.png');

figure;
yyaxis left
plot(t, rad2deg(x(:,9)))
ylabel('Theta [deg]')
yyaxis right
plot(t, rad2deg(dth'))
ylabel('Theta Dot [deg/s]');
xlabel('Time [s]')
title('Theta Relations')
saveas(gcf, 'Figures/P4thetaRelations.png');


function [dxdt, R, dth] = guide(t, x, N)

tdv = 0;
tdhead = x(4);
tdx = x(1)*cosd(x(4));
tdy = x(1)*sind(x(4));
tx = x(2);
ty = x(3);

mth = x(8);
mdx = x(5)*cosd(mth);
mdy = x(5)*sind(mth);
mx = x(6);
my = x(7);

X  = tx-mx;
Y  = ty-my;
R  = sqrt(X^2+Y^2);
th = x(9);
thn = (atan2(Y,X));
dth = thn-th;

tvx = tdx;
tvy = tdy;
mvx = x(5)*cosd(x(8));
mvy = x(5)*sind(x(8));
vc = x(10);
vcn  = sqrt((mvx + tvx)^2 + (mvy + tvy)^2);
dvc = vcn-vc;
a = N * (dth) * vc;

mdth = a/10;
mdv = 0;

dxdt = [tdv; tdx; tdy; tdhead; mdv; mdx; mdy; mdth; dth; dvc];
end 


