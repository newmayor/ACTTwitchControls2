global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

initialization();

[theta2,theta3] = arm_angles();

% Test pot values
% disp(theta2);
% disp(theta3); 

er = 1;
while er == 1
    finalpos();
    er = errorcheck();
end

orientation();
% MOVE ARM TO X_F, Y_F, WITH DESIRED ORIENTATION.