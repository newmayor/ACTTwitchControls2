determine_ori()
% Description: to check for the shortest displacement of initial and final 
% thetas, to determine best arm orientation in the event that both angle 
% pairs are valid. 

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

[int_theta2, int_theta3] = thetas();
[theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(x_f,y_f);

dori2_1 = theta2_1 - int_theta2;
dori3_1 = theta3_1 - int_theta3;
dori2_2 = theta2_2 - int_theta2;
dori3_2 = theta3_2 - int_theta3;

if  abs(dori2_1) < abs(dori2_2)
    if abs(dori3_1) < abs(dori3_2)
        target_ori = 1;
    end
    
elseif abs(dori2_1) > abs(dori2_2)
    if abs(dori3_1) > abs(dori3_2)
        target_ori = 2;
    end   
else
    error('determine_ori:target_ori','Orientation cannot be determined.')
end