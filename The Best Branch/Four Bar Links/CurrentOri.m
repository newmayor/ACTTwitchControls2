function [  ] = CurrentOri(  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

x = x_i;    % I do not know if it is correct to use the initial values for this math
y = y_i;

[thetaPot2, thetaPot3] = thetas();
[theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(x,y);

if abs(thetaPot2 - theta2_1) < abs(thetaPot2 - theta2_2) && abs(thetaPot3 - theta3_1) < abs(thetaPot3 - theta3_2) 
    curr_ori = 1;
elseif abs(thetaPot2 - theta2_1) > abs(thetaPot2 - theta2_2) && abs(thetaPot3 - theta3_1) > abs(thetaPot3 - theta3_2)
    curr_ori = 2;
end

end

