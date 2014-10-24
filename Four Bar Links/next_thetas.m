% This functions returns the next sets of thetas of the arm in radians. 

function [theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(x,y)

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

L2 = 9.0;   % Length of inner arm (inches)
L3 = 14.75;

theta3_1 = atan(y/x) + acos((x^2 + y^2 - L2^2 + L3^2)/(2 * L3 * sqrt(x^2 + y^2)));
theta2_1 = asin((y - L3 * sin(theta3_1))/L2);

theta3_2 = atan(y/x) - acos((x^2 + y^2 - L2^2 + L3^2)/(2 * L3 * sqrt(x^2 + y^2)));
theta2_2 = asin((y - L3 * sin(theta3_2))/L2);