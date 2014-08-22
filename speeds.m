function [s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2)

% convert r's and theta's to Cartesian coordinates
x_i = r_i * cos(theta_i);
x_f = r_f * cos(theta_f);
y_i = r_i * sin(theta_i);
y_f = r_f * sin(theta_f);

% differences in x- and y-positions
dx = x_f - x_i;
dy = y_f - y_i;

m = dy/dx; % slope of linear motion line
c = r_i * sin(theta_i) - m * r_i * cos(theta_i); % y-intercept of linear motion line

syms t;

theta1(t) = pi - t - asin(L2 * sin(acos((-(c / (sin(t) - m * cos(t)))^2 + L1^2 + L2^2) / (2 * L1 * L2))) / (c / (sin(t) - m * cos(t))));
theta2(t) = acos((c / (sin(t) - m * cos(t))^2 + L1^2 + L2^2) / (2 * L1 * L2));

s1 = diff(theta1);  % derivative of theta1
s2 = diff(theta2);  % derivative of theta2

theta_i = theta_i * pi / 180;

s1 = eval(subs(s1,t,theta_i));  % evaluate derivative of theta1
s2 = eval(subs(s2,t,theta_i));  % evaluate derivative of theta2