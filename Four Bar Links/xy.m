% This function returns current xy-points of the arm. 

function [x,y] = xy(theta2,theta3)

global L2 L3 theta1 theta4
global x_f y_f
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

x = L2 * cos(theta2) + L3 * cos(theta3);
y = L2 * sin(theta2) + L3 * sin(theta3);