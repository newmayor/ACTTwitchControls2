function [x,y] = next_xy(x_curr,y_curr,ep)

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

if (x_curr == x_i) && (y_curr == y_i)
    x = ep; 
    dx = x_f - x_i; dy = y_f - y_i; 
    y = y_i + (x - x_i) * dy/dx; 
else
    x = x_curr + ep; 
    dx = x_f - x_curr; dy = y_f - y_curr; 
    y = y_curr + (x - x_curr) * dy/dx;
end