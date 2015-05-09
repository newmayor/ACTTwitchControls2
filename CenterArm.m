function CenterArm()
global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

DriveMotor(0,0.5)
DriveMotor(1,0.5)

% initializes the arm position at the start of the simulation
% sweep the range of motion
pot1stat = 0;
pot2stat = 0;
while(~pot1stat || ~pot2stat)
    fprintf('PIN0: %d, PIN1: %d\n',a.analogRead(pin_pot1),a.analogRead(pin_pot2)); 
    if(a.analogRead(pin_pot1)<400)
        disp('moving motor 1');
        %disp('PIN1: '); disp(a.analogRead(pin_pot1));
        DriveMotor(motor1,0);
        pot1stat=1;
    end
    if(a.analogRead(PIN_pot1)>800)
        disp('moving motor 2');
        %disp('PIN2: '); disp(a.analogRead(pin_pot2));
        DriveMotor(motor2,0);
        pot2stat=1;
    end
end
pot1stat = 0;
pot2stat = 0;
DriveMotor(motor1,-0.5)
DriveMotor(motor2,-0.5)
while(~pot1stat || ~pot2stat)
    if(a.analogRead(pin_pot1)>300)
        DriveMotor(motor1,0);
        pot1stat=1;
    end
    if(a.analogRead(pin_pot2)<500)
        DriveMotor(motor2,0);
        pot2stat=1;
    end
end
    
% Go to 90 degrees
pot1stat = 0;
pot2stat = 0;
DriveMotor(motor1,0.5)
DriveMotor(motor2,0.5)
while(~pot1stat || ~pot2stat)
    if(a.analogRead(pin_pot1)<400)
        DriveMotor(motor1,0);
        pot1stat=1;
    end
    if(a.analogRead(pin_pot2)>1000)
        DriveMotor(motor2,0);
        pot2stat=1;
    end
end