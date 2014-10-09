% Parameters:User is prompted to input desired ending x and y coordinates
% of arm.
% Results: Saves the final x and y coordinates of the arm as global variables.
% Description: Globalizes variables. Prompts the user for the final x-coordinate
% and final y-coordinate of the arm.

global L2 L3 theta1 theta4
global x_f y_f
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

% Final xy-points
x_f  = input('Input the target X coordinate: ');
y_f = input('Input the target Y coordinate: ');