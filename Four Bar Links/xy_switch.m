function [x_s,y_s] = xy_switch()

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

syms x

L2 = 9.0; L3 = 9.0; x_i = 1; y_i = 1; x_f = 2; y_f = 3; 

m = slope(); 
b = y_f - m * x_f; 
r = sqrt(x^2 + (m * x + b)^2);
x_s = vpa(solve(r == (L2 + L3),x));
y_s = vpa(m * x_s + b); 

%[theta2,theta3,gamma] = thetas();
theta2 = 3 * pi/4; 
theta3 = pi/4; 

if theta3 < (pi/2)
    angle = 1; 
    theta_btw = theta3 + (pi - theta2);
else % If theta2 > pi/2.
    angle = -1; 
    theta_btw = pi - theta3;
    theta_btw = theta2 + theta_btw;
end

fprintf('theta_btw: %f\n', theta_btw);
r = sqrt(L2^2 + L3^2 - 2 * L2 * L3 * cos(theta_btw)); 
fprintf('r: %f\n', r);

if angle > 0
    theta = theta2 - asin(sin(theta_btw) * L3 / r); 
else
    theta = theta2 + asin(sin(theta_btw) * L3 / r); % asin boundaries. 
end

fprintf('theta: %f\n', theta);

if theta < (pi/2)
    x_s = x_s(x_s > 0);
end
if theta > (pi/2)
    x_s = x_s(x_s < 0); 
end
y_s = y_s(y_s > 0); 
if theta == (pi/2)
    x_s = 0;
    if r == L2 + L3
        y_s = r; 
    else
        y_s = y_s(y_s > 0); 
    end
end

disp(x_s); disp(y_s); 