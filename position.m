function [r,theta] = position(theta1,theta2,angle)

global L1 L2

r = (L1^2 + L2^2 - 2 * L1 * L2 * cos(theta2))^(1/2);

if angle > 0
    theta = pi - theta1 - asin((L2 * sin(theta2)) / r); % from +x axis
else
    theta = pi - (theta1 - asin((L2 * sin(theta2)) / r)); % from +x axis
end