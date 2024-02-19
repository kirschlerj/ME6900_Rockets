close all;
clc;

figure(1)
plot(out.Drag(:,1), out.Drag(:,2));
hold on
plot(out.Thrust(:,1), out.Thrust(:,2));
plot(out.TotalForce(:,1), out.TotalForce(:,2))
legend('Drag','Thrust','Total')
grid on
xlabel('Simulation Time [s]')
ylabel('Force [N]')
title('Body Forces')

figure(2)
yyaxis left
plot(out.vel(:,1), out.vel(:,2))
hold on
plot(out.vel(:,1), out.vel(:,3))
ylabel('Velocity [m/s]')
yyaxis right
plot(out.Accel(:,1), out.Accel(:,2))
hold on
plot(out.Accel(:,1), out.Accel(:,3))
ylabel('Acceleration [m/s^2]')
xlabel('Simulation Time [s]')
title('Body Dynamics')
grid on
legend('Vertical Velocity','Horizontal Velocity','Vertical Acceleration','Horizontal Acceleration')

figure(3)
yyaxis left
plot(out.Cd(:,1), out.Cd(:,2))
hold on
ylabel('Coefficient of Drag [-]')
yyaxis right
plot(out.q(:,1), out.q(:,2))
ylabel('Dynamic Pressure [Pa]')
xlabel('Simulation Time [s]')
title('Aerodynamic Factors')
grid on
legend('Coefficent of Drag', 'Dynamic Pressure')

figure(4)
yyaxis left
plot(out.Altitude(:,1), out.Altitude(:,2))
hold on
ylabel('Altitude [m]')
yyaxis right
plot(out.mach(:,1), out.mach(:,2))
ylabel('Mach [-]')
xlabel('Simulation Time [s]')
title('Flight Profile')
grid on
legend('Altitude', 'Mach')
x1 = xline(8.1,'--','Max q / Motor cutoff');
x1.LabelVerticalAlignment = 'bottom';
x2 = xline(22.9,'--','Apogee');
x2.LabelVerticalAlignment = 'bottom';