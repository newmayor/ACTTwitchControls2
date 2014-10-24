function [x,y] = next_xy(x_curr,y_curr,ep)

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

x = x_curr + ep; 
dx = x_curr - x_i; dy = y_curr - y_i; 
y = (dy/dx) * ep - y_curr;