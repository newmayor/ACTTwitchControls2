global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

initialization();

er = 1;
while er == 1
    finalpos();
    er = errorcheck();
end

orientation();
% MOVE ARM TO X_F, Y_F, WITH DESIRED ORIENTATION.