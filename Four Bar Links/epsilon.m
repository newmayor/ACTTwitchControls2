function [ep,steps] = epsilon(div)

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

dx = x_f - x_i; dy = y_f - y_i; % inches
distance = sqrt(dx^2 + dy^2); 
steps = floor(distance/div);
ep = dx - dx * (distance - div) / distance;