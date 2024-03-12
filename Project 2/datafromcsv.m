clc;
clear;
close all;

data = readtable('./RocketSim/rocketSimData.csv');

time = data.time;
%alt = data.altitude;
%vel = data.vel;
%accel = data.accel;
mass = data.mass;

[C, ia] = unique(data.mach);
B = data(ia,:);

mach = B.mach;
cd = B.cd;

%save('time.mat', 'time')
%save('mass.mat', 'mass')
save('mach.mat', 'mach')
save('cd.mat', 'cd')