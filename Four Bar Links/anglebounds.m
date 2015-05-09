function [er_1,er_2] = anglebounds(x_curr,y_curr)

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

[theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(x_curr,y_curr);

if (theta2_1 >= theta2_min) && (theta2_1 <= theta2_max)
    er_1 = 0;
else
    er_1 = 1;
end 
if (theta3_1 >= theta3_min) && (theta3_1 <= theta3_max)
    er_1 = 0;
else
    er_1 = 1;
end 

if (theta2_2 >= theta2_min) && (theta2_2 <= theta2_max)
    er_2 = 0;
else
    er_2 = 1;
end 
if (theta3_2 >= theta3_min) && (theta3_2 <= theta3_max)
    er_2 = 0;
else
    er_2 = 1;
end 