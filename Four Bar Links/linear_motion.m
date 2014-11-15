function linear_motion(target_x,target_y )
% Description: To populate a movement position array (without error
% procedures). Goes through each of the movements array coordinates. 
% Determines the delta theta of the current position and the desired next position 
% on the linear path. 
% Runs motors for a certain time duration to move are to new position 
% Repeats loop until final position is reached

global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

[ep,steps] = epislon(div); 
movePos = simulation2(target_x,target_y,ep,steps); 
x = 1; % Assuming the first position is in row 1 (not 0) of the matrix.  

while(x ~= steps)
    [theta2,theta3,gamma] = thetas();
    [theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(movePos(x,1),movePos(x,2));
    
    if (target_ori == 1)
        next_theta2 = theta2_1;
        next_theta3 = theta3_1;
    elseif (target_ori == 2)
        next_theta2 = theta2_2;
        next_theta3 = theta3_2;
    else
        error('linear_motion:target_ori','Cannot determime which orientation angles to use.')
    end
    
    dtheta2 = next_theta2 - theta2;
    dtheta3 = next_theta3 - gamma;
    
    MotorsON(dtheta2, dtheta3); % Calculates voltage and runs motors.
    delay(time); % DETERMINE TIME.
    MotorsOFF(); % Voltage to motors ZERO.
    
    x = x + 1;
end