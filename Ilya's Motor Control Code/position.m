[r_i,theta_i] = position(theta1,theta2);
%caculates new r_i and theta_i for every loop.

r = (L1^2 + L2^2 - 2 * L1 * L2 * cos(theta2))^(1/2);
theta = pi - theta1 - asin((L2 * sin(theta2)) / r);