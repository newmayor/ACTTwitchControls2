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