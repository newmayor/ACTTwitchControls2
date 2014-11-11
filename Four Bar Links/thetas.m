 % This function returns current angles of the arm in radians.
function [theta2,theta3] = thetas()
global L2 L3 theta1 theta4 x_i y_i x_f y_f
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2
% Output angles in radians
theta2 = pi - ((a.analogRead(PIN_pot1) - theta1_min) / (theta1_max - theta1_min) * pi); % from +x axis
theta3 = pi - ((a.analogRead(PIN_pot2) - theta2_min) / (theta2_max - theta2_min) * pi); % from +x axis
%for case when theta2 is <90 degrees
phi=pi/2-theta2+theta3;
%for case when theta2> 90 degrees
gamma=theta3-theta2+pi/2;