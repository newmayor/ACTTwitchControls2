global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

duty_min = 0.5; 
duty_max = 1; 
duty_step = 0.1; 

pot_min = 10; 
pot_max = 170; 

pot2 = pot_degree(2);
pot2_buffer = 0.05 * pot2; % Buffer resistance value is 5% of pot value

while pot2 <= pot_max
    drive_motor(motor2, -0.5);
    pot2 = pot_degree(2);
end
drive_motor(motor2, 0);

vel = zeros(size(10,11));
for duty = duty_min:duty_step:duty_max
    i = 1;
    vel(i,1) = duty;
    
    % Joint 2: Forward Direction
    tic
    while pot2 >= pot_min
        drive_motor(motor2,duty);
        pot2 = pot_degree(2);
    end
    drive_motor(2,0);
    time = toc;
    fprintf('Joint 2 (forward motion) time elapsed: %d seconds using a %d duty cycle. \n', time, duty)
    vel(i,2) = time; 
    
    % Joint 2: Reverse Direction
    tic
    while pot2 <= pot2_max
        drive_motor(motor2, -duty);
        pot2 = pot_degree(2);
    end
    drive_motor(motor2, 0);
    time = toc;
    fprintf('Joint 2 (backward motion) time elapsed: %d seconds using a %d duty cycle.\n', time, duty)
    vel(i,3) = time;
    
    % Average time to sweep through angular range
    vel(i,4) = (vel(i,2) + vel(i,3))/2; 
    % Angle ranges
    vel(i,5) = pot2_max - pot2_min; % Arm 2
    % Average angular velocities
    vel(i,6) = vel(i,5)/vel(i,4); % Arm 2
    
    i = i+1;
end

% Export vel array to Excel
xlswrite('vel_profile.xlsx', vel);