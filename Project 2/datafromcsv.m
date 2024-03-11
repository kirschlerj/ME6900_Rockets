clc;
clear;
close all;

data = readtable('rocketSimData.csv');

time = data.time;
%alt = data.altitude;
%vel = data.vel;
%accel = data.accel;
mass = data.mass;
mach = data.mach;
cd = data.cd;


save('time.mat', 'time')
save('mass.mat', 'mass')
save('mach.mat', 'mach')
save('cd.mat', 'cd')