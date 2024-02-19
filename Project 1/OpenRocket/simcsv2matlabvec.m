clc;
clear;
close all;

%table data
simdata = readtable('simdata.csv');
[C,ia] = unique(simdata.MachNumber);
simdata_unique = simdata(ia,:);

mach = simdata_unique.MachNumber;
cd = simdata_unique.DragCoefficient;

save('machsim.mat', 'mach');
save('cdsim.mat', 'cd');