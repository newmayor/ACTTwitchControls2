% Parameters: theta1, angle between the axes and the upper arm; theta 2 the
% angle between the upper arm and the forearm ; "angle" the angle of the full arm
% Returns: the polar position of the arm
% Description:Function pulls the length of the upper arm and forearm then 
% calculates the length of the full arm's position (r). The function then checks
% to see if the total angle created by the arm is on the positive or negative 
% x axis. The funcion then determines the appropriate calculation to get the total
% angle of the arm.

function [r,theta] = position(theta1,theta2,angle)

global L1 L2

r = (L1^2 + L2^2 - 2 * L1 * L2 * cos(theta2))^(1/2);

if angle > 0
    theta = pi - theta1 - asin((L2 * sin(theta2)) / r); % from +x axis
else
    theta = pi - (theta1 - asin((L2 * sin(theta2)) / r)); % from +x axis
end