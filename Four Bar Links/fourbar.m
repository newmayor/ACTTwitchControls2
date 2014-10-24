% Setup
clear all;
clc
close all;

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

initialization();

er = 1;
while er == 1
    finalpos();
    er = errorcheck();
end

% determine orientation