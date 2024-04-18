% ME 6900 Project 5 - ProNav Deep Dive
clear, clc, close all

% Constants
c = 343;
tSim = 25;
N = 0.1;

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
vc0     = sqrt((mv0*cos(launch_ang) + tv0*cos(thead0))^2 + (mv0*sin(launch_ang) + tv0*sin(thead0))^2);

% ODE Solver
[t, x] = ode45(@(t,x) guide(t, x, N), [0 tSim],[tv0; tx0; ty0; thead0; mv0; mx0; my0; launch_ang; th0; vc0]);
 


for i = 1:length(t)
    [~, R(i), dth(i), mdth(i), a(i)] = guide(t(i), x(i,:), N);
    
    idx = find(R == min(R));
    Rmin = min(R);
    
    for i = 1:idx
        mx(i) = x(i,6);
        my(i) = x(i,7);    
        tx(i) = x(i,2);
        ty(i) = x(i,3);
        th(i) = x(i,9);
        time(i) = t(i);

        X = [mx(i) tx(i)];
        Y = [my(i) ty(i)];
    end 
 
end 


% Plotting
figure;
plot(tx, ty)
hold on
plot(mx, my)
xlabel('X Position [m]')
ylabel('Y Position [m]')
title('Flight Profile')
legend('Target Position', 'Missile Position');
% saveas(gcf, 'Figures/P4Trajectories.png');


function [dxdt, R, dth, mdth, a] = guide(t, x, N)


tdhead = x(4);
tdv = 20;
tdx = x(1)*cos(x(4));
tdy = x(1)*sin(x(4));
tv = sqrt(tdx^2+tdy^2);
tx = x(2);
ty = x(3);

mth = x(8);
mdx = x(5)*cos(mth);
mdy = x(5)*sin(mth);
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
mvx = x(5)*cos(x(8));
mvy = x(5)*sin(x(8));
vc = x(10);
vcn  = sqrt((mvx + tvx)^2 + (mvy + tvy)^2);
dvc = vcn-vc;
a = N * (dth) * vc;


mdth = a/10;
mdv = 0;

dxdt = [tdv; tdx; tdy; tdhead; mdv; mdx; mdy; mdth; dth; dvc];
end 
