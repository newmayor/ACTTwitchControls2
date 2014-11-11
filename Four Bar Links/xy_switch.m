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

[r,theta] = polar_position();
% r is leaning towards +x axis. 
if theta < (pi/2)
    x_s = x_s(x_s > 0);
end
% r is leaning towards -x axis.
if theta > (pi/2)
    x_s = x_s(x_s < 0); 
end
y_s = y_s(y_s > 0); 
% r is straight up. 
if theta == (pi/2)
    x_s = 0;
    % Arm is straight up.
    if r == L2 + L3
        y_s = r; 
    % Arm is bent.
    else
        y_s = y_s(y_s > 0); 
    end
end