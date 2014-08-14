function [r,theta] = position(theta1,theta2);

global L1 L2
r = (L1^2 + L2^2 + 2 * L1 * L2 * cos(theta2))^(1/2);

theta = (theta1 - asin((L2 * sin(theta2)) / r))+.5*pi;