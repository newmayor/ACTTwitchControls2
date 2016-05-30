% This functions calculates the next sets of thetas of the arm in radians, then returns them in pot values. 

function [theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(x,y)

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

% Set 1 thetas.
theta3_1 = atan(y/x) + acos((x^2 + y^2 - L2^2 + L3^2)/(2 * L3 * sqrt(x^2 + y^2)));
theta3_1 = (theta3_1/(2 * pi) * 1024); 

theta2_1_sin = asin((y - L3 * sin(theta3_1))/L2);
theta2_1_sin = rad2deg(theta2_1_sin);

theta2_1 = acos((x - L3 * cos(theta3_1))/L2);
theta2_1 = (theta2_1/(2 * pi) * 1024); 

% Set 2 thetas.
theta3_2 = atan(y/x) - acos((x^2 + y^2 - L2^2 + L3^2)/(2 * L3 * sqrt(x^2 + y^2)));
theta3_2 = (theta3_2/(2*pi) * 1024); 

theta2_2_sin = asin((y - L3 * sin(theta3_2))/L2);
theta2_2_sin = rad2deg(theta2_2_sin); 

theta2_2 = acos((x - L3 * cos(theta3_2))/L2);
theta2_2 = (theta2_2/(2 * pi) * 1024); 