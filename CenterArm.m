function CenterArm()

global a MOTOR0 MOTOR1 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot0 PIN_pot1 PIN_pot2 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit Pot1_RLimit Pot1_LLimit

DriveMotor(0,0.5)
DriveMotor(1,0.5)

% initializes the arm position at the start of the simulation
% sweep the range of motion
pot1stat = 0;
pot2stat = 0;
while(~pot1stat || ~pot2stat)
    fprintf('PIN0: %d, PIN1: %d\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1)); 
    if(a.analogRead(PIN_pot0)<400)
        disp('moving motor 1');
        %disp('PIN1: '); disp(a.analogRead(PIN_pot0));
        DriveMotor(MOTOR0,0);
        pot1stat=1;
    end
    if(a.analogRead(PIN_pot1)>800)
        disp('moving motor 2');
        %disp('PIN2: '); disp(a.analogRead(PIN_pot1));
        DriveMotor(MOTOR1,0);
        pot2stat=1;
    end
end
pot1stat = 0;
pot2stat = 0;
DriveMotor(0,-0.5)
DriveMotor(1,-0.5)
while(~pot1stat || ~pot2stat)
    if(a.analogRead(PIN_pot0)>300)
        DriveMotor(MOTOR0,0);
        pot1stat=1;
    end
    if(a.analogRead(PIN_pot1)<500)
        DriveMotor(MOTOR1,0);
        pot2stat=1;
    end
end
    
% Go to 90 degrees
pot1stat = 0;
pot2stat = 0;
DriveMotor(0,0.5)
DriveMotor(1,0.5)
while(~pot1stat || ~pot2stat)
    if(a.analogRead(PIN_pot0)<400)
        DriveMotor(MOTOR0,0);
        pot1stat=1;
    end
    if(a.analogRead(PIN_pot1)>1000)
        DriveMotor(MOTOR1,0);
        pot2stat=1;
    end
end