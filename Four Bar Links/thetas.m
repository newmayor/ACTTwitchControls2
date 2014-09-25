% This function returns current angles of the arm in radians. 

function [theta2,theta3] = thetas()

global L2 L3 theta1 theta4
global x_f y_f
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

% Output angles in radians
theta2 = pi - ((a.analogRead(PIN_pot1) - theta1_min) / (theta1_max - theta1_min) * 180) * pi / 180; % from +x axis
theta3 = pi - ((a.analogRead(PIN_pot2) - theta2_min) / (theta2_max - theta2_min) * 180) * pi / 180; % from +x axis