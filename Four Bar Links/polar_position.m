function [r,theta] = polar_position()

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

[theta2,theta3,gamma] = thetas();
[theta_btw,direc] = theta_between(theta2,theta3);

r = sqrt(L2^2 + L3^2 - 2 * L2 * L3 * cos(theta_btw)); 

if direc > 0
    theta = theta2 - asin(sin(theta_btw) * L3 / r); 
else
    theta = theta2 + asin(sin(theta_btw) * L3 / r); 
end