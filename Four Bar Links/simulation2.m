function er = simulation2(ep,steps,target_x,target_y)

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

div = 0.5;
[ep,steps] = epsilon(div);

er_orient = zeros(steps - 1, 2);
x_curr = x_i; y_curr = y_i; 
for i = 1:(steps - 1)
    [x_curr,y_curr] = next_xy(x_curr,y_curr,ep);
    [er_ori(i,1),er_ori(i,2)] = anglebounds(x_curr,y_curr);
end

if isequal(er_ori(:,1),0) || isequal(er_ori(:,2),0)
    er = 0;
else
    er = 1;
end