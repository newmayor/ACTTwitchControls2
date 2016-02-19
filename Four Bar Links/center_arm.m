function center_arm()

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

drive_motor(motor1,0.5);
drive_motor(motor2,0.5);

% Initializes the arm position at the start of the simulation
% Sweep the range of motion
pot1_stat = 0;
pot2_stat = 0;

while(~pot1_stat || ~pot2_stat)
    % fprintf('PIN1: %d, PIN2: %d\n',a.analogRead(pin_pot1),a.analogRead(pin_pot2)); 
    
    if(a.analogRead(pin_pot1) < 300)
        % disp('moving motor 1');
        % disp('PIN1: '); disp(a.analogRead(pin_pot1));
        drive_motor(motor1,0);
        pot1_stat = 1;
    end
    if(a.analogRead(pin_pot2) < 200)
        % disp('moving motor 2');
        % disp('PIN2: '); disp(a.analogRead(pin_pot2));
        drive_motor(motor2,0);
        pot2_stat = 1;
    end
end

pot1_stat = 0;
pot2_stat = 0;
drive_motor(motor1,-0.5);
drive_motor(motor2,-0.5);

while(~pot1_stat || ~pot2_stat)
    if(a.analogRead(pin_pot1) > 800)
        drive_motor(motor1,0);
        pot1_stat = 1;
    end
    if(a.analogRead(pin_pot2) > 800)
        drive_motor(motor2,0);
        pot2_stat = 1;
    end
end
    
% Go to 90 degrees
pot1_stat = 0;
pot2_stat = 0;
drive_motor(motor1,0.5);
drive_motor(motor2,0.5);

while(~pot1_stat || ~pot2_stat)
    if(a.analogRead(pin_pot1) < 526)
        drive_motor(motor1,0);
        pot1_stat=1;
    end
    if(a.analogRead(pin_pot2) < 561)
        drive_motor(motor2,0);
        pot2_stat=1;
    end
end