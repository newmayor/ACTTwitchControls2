% Parameters: Need to input the original coordinates first in cartesian, the 
% the x and y coordinates, and next in polar, the radius and angle of the entire
% arm, in refrence to the global axes.
% Returns: the evaluated derivative of theta 1 and theta 2.
% Description: The function will pull in the desired final postion coordinates
% and the lengths of the upper arm and forearm. Next the function calculates the
% diffrence between the current position and desired position. The slope of the 
% linear motion line is found along with the y-intercept. Theta 1, the angle between
% the axes and the upper arm, and theta 2, the angle between the upper arm and the
% forearm, are expressed in terms of the angle the entire arm makes with the 
% axes, variable t in the code. The derivatives of theta 1 and theta 2 
% are found with respect to t. The derivatives of theta 1 and theta 2 are 
% evaluated by replacing the starting theta for the whole arm
% into the derivative equations for theta 1 and theta 2.

function [s1,s2] = speeds(x_i,y_i,r_i,theta_i)

global r_f theta_f x_f y_f
global L1 L2

% differences in x- and y-positions
dx = x_f - x_i;
dy = y_f - y_i;

m = dy/dx; % slope of linear motion line
c = r_i * sin(theta_i) - m * r_i * cos(theta_i); % y-intercept of linear motion line
fprintf('dx: %d, dy: %d, m: %d, c: %d\n',dx,dy,m,c);

syms t;
theta1(t) = pi - asin((L2 * sin(acos((L1^2 + L2^2 - (c / (sin(t) - m * cos(t)))^2) / (2 * L1 * L2)))) / (c / (sin(t) - m * cos(t)))) - t;
theta2(t) = acos((L1^2 + L2^2 - (c / (sin(t) - m * cos(t)))^2) / (2 * L1 * L2));

s1 = diff(theta1);  % derivative of theta1
s2 = diff(theta2);  % derivative of theta2

s1 = eval(subs(s1,t,theta_i));  % evaluate derivative of theta1
s2 = eval(subs(s2,t,theta_i));  % evaluate derivative of theta2