function center_arm()

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

DriveMotor(motor1,0.5);
DriveMotor(motor2,0.5);

% Initializes the arm position at the start of the simulation
% Sweep the range of motion
pot1_stat = 0;
pot2_stat = 0;

while(~pot1_stat || ~pot2_stat)
    fprintf('PIN0: %d, PIN1: %d\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1)); 
    
    if(a.analogRead(pin_pot1) < 400)
        disp('moving motor 1');
        %disp('PIN1: '); disp(a.analogRead(PIN_pot0));
        DriveMotor(motor1,0);
        pot1_stat = 1;
    end
    if(a.analogRead(pin_pot2) > 800)
        disp('moving motor 2');
        %disp('PIN2: '); disp(a.analogRead(PIN_pot1));
        DriveMotor(motor2,0);
        pot2_stat = 1;
    end
end

pot1_stat = 0;
pot2_stat = 0;
DriveMotor(motor1,-0.5);
DriveMotor(motor2,-0.5);

while(~pot1_stat || ~pot2_stat)
    if(a.analogRead(pin_pot1) > 300)
        DriveMotor(motor1,0);
        pot1_stat = 1;
    end
    if(a.analogRead(pin_pot2) < 500)
        DriveMotor(motor2,0);
        pot2_stat = 1;
    end
end
    
% Go to 90 degrees
pot1_stat = 0;
pot2_stat = 0;
DriveMotor(motor1,0.5);
DriveMotor(motor2,0.5);

while(~pot1_stat || ~pot2_stat)
    if(a.analogRead(pin_pot1) < 400)
        DriveMotor(motor2,0);
        pot1_stat=1;
    end
    if(a.analogRead(pin_pot2) > 1000)
        DriveMotor(motor2,0);
        pot2_stat=1;
    end
end