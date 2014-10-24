function [er_1,er_2] = anglebounds(x_curr,y_curr)

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

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