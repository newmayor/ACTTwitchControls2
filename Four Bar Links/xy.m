% This function returns current xy-points of the arm. 

function [x,y] = xy(theta2,theta3)

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

x = L2 * cos(theta2) + L3 * cos(theta3);
y = L2 * sin(theta2) + L3 * sin(theta3);