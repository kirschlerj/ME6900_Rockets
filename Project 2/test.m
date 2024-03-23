close all

mach = out.mach(:,2);
cd = out.Cd(:,2);
alt = out.Altitude(:,2);
angle = out.Angle(:,2);
dens = density(2,:)';

[mach_sort, idxs] = sort(mach);
cd_sort = cd(idxs);


[alt_sort, idxs] = sort(alt);
cd_sort = cd(idxs);
angle_sort = angle(idxs);

figure
plot(alt_sort, cd_sort, 'LineWidth',1);
xlim([0, 70000]);
grid on
xlabel('Altitude [m]')
ylabel('Coefficient of Drag [-]')
title('Cd vs. Altitude')

figure
plot(alt_sort, angle_sort)
grid on
xlabel('Altitude [m]')
ylabel('Turn Angle [deg]')
title('Rocket Turn Angle vs. Altitude')

figure
plot(alt, dens)
grid on
xlabel('Altitude [m]')
ylabel('Density [kg/m^3]')
title('Air Density vs. Altitude')