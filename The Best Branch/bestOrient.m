function [ BestOrientation ] = bestOrient(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global L2 L3 theta1 theta4 x_i y_i x_f y_f
global div steps ep
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

[int_theta2, int_theta3] = thetas();
[theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(x_f,y_f);

delta_orient2_1 = theta2_1 - int_theta2;
delta_orient3_1 = theta3_1 - int_theta3;
delta_orient2_2 = theta2_2 - int_theta2;
delta_orient3_2 = theta3_2 - int_theta3;

if  delta_orient2_1 < delta_orient2_2
    if delta_orient3_1 < delta_orient3_2
        BestOrientation = 1;
    end
elseif delta_orient2_1 > delta_orient2_2
    if delta_orient3_1 > delta_orient3_2
        BestOrientation = 2;
    end   
else
    disp('Error: Cannot choose best orientation for movement');
end




end

