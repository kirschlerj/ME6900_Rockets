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
saveas(gcf, 'Figures/bodyforces.png');

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
saveas(gcf, 'Figures/bodydynamics.png');

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
saveas(gcf, 'Figures/aerofactors.png');

figure(4)
yyaxis left
altp = plot(out.Altitude(:,1), out.Altitude(:,2));
hold on
ylabel('Altitude [m]')
yyaxis right
machp = plot(out.mach(:,1), out.mach(:,2));
ylabel('Mach [-]')
xlabel('Simulation Time [s]')
title('Flight Profile')
grid on
% x1 = xline(160,'--','Max q');
% x1.LabelVerticalAlignment = 'bottom';
% x2 = xline(214,'--','Apogee');
% x2.LabelHorizontalAlignment = 'left';
% x2.LabelVerticalAlignment = 'middle';
% x3 = xline(160,'--','Motor Cutoff');
% x3.LabelVerticalAlignment = 'middle';
legend([altp, machp], 'Altitude', 'Mach')
saveas(gcf, 'Figures/flightprofile.png');

figure(5)
plot(out.Gravity(:,1), out.Gravity(:,2)*-1)
ylabel('Gravity [m/s^2]')
xlabel('Simulation Time [s]')
title('Acceleration Due to Gravity vs Time')
grid on
saveas(gcf, 'Figures/gravity.png');

figure(6)
yyaxis left
vertforce = plot(out.Verticalforce(:,1), out.Verticalforce(:,2));
hold on
ylabel('Vertical Force [N]')
yyaxis right
sideforce = plot(out.Verticalforce(:,1), out.Sideforce(:,1));
ylabel('Side Force [N]')
grid on
xlabel('Simulation Time [s]')
legend([vertforce, sideforce],'Vertical Force', 'Side Force')
title('Body Forces')
saveas(gcf, 'Figures/sidevertforces.png');

figure(7)
plot(out.Angle(:,1), out.Angle(:,2)*-1 + 90)
ylabel('Angle [deg]')
xlabel('Simulation Time [s]')
grid on
title('Angle of Attack vs Time')
saveas(gcf, 'Figures/angle.png');

size_dmdt = size(out.dmdt);
mass_vec = ones(size_dmdt(1),1);
cur_mass = 1446.58165;
for i=1:1:length(mass_vec)
    mass_vec(i,1) = cur_mass;
    cur_mass = cur_mass + out.dmdt(i,2);
end


figure(8)
plot(out.dmdt(:,1), mass_vec)
xlabel('Simulation Time [s]')
ylabel('Mass [kg]')
grid on
title('Mass vs time')
saveas(gcf, 'Figures/mass.png');

result_vel = sqrt(out.vel(:,2).^2 + out.vel(:,3).^2);
figure(9)
plot(out.vel(:,1), result_vel)
xlabel('Simulation Time [s]')
ylabel('Resultant Velocity [m/s]')
grid on
title('Resultant Velocity vs Time')
saveas(gcf, 'Figures/resultantvelocity.png');

figure(10)
plot(out.pos(:,2), out.pos(:,3)*-1)
axis equal
xlim([min(out.pos(:,2))-100000, 300000]);
ylim([min(out.pos(:,3)*-1), max(out.pos(:,3)*-1)])
xlabel('Horizontal Position [m]')
ylabel('Vertical Position [m]')
grid on
title('Rocket Heading')
saveas(gcf, 'Figures/heading.png');

figure(11)
plot(out.AngularVel(:,1), out.AngularVel(:,2))
xlabel('Simulation Time [s]')
ylabel('Angular Velocity [rad/s]')
grid on
title('Angular Velocity vs Time')
saveas(gcf, 'Figures/angularvelocity.png');

% sim = readtable('./RocketSim/rocketSimData.csv');
% figure(5)
% yyaxis left
% plot(out.Altitude(:,1), out.Altitude(:,2))
% hold on
% plot(sim.time, sim.altitude*)
% ylabel('Altitude [m]')
% yyaxis right
% plot(out.vel(:,1), out.vel(:,2))
% hold on
% plot(sim.time, sim.vel)
% ylabel('Vertical Velocity [m/s]')
% xlabel('Time [s]')
% title('Open Rocket vs Simulink')
% legend('Simulink Altitude', 'Open Rocket Altitude', 'Simulink Vertical Velocity', 'Open Rocket Vertical Velocity')
