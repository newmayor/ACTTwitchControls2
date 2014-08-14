function ArmSweep()
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit

DriveMotor(0,.5)
DriveMotor(1,.5)
%initializes the arm position at the start of the simulation
% sweep the range of motion
    pot1stat = 0;
    pot2stat = 0;
    while(~pot1stat || ~pot2stat)
        if(a.analogRead(PIN_pot0)<270)
            DriveMotor(MOTOR1,0);
            pot1stat=1;
        end
        if(a.analogRead(PIN_pot1)<190)
            DriveMotor(MOTOR2,0);
            pot2stat=1;
        end
%         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1));
    end
    pot1stat = 0;
    pot2stat = 0;
    DriveMotor(0,-.3)
    DriveMotor(1,-.3)
    while(~pot1stat || ~pot2stat)
        if(a.analogRead(PIN_pot0)>980)
            DriveMotor(MOTOR1,0);
            pot1stat=1;
        end
        if(a.analogRead(PIN_pot1)>880)
            DriveMotor(MOTOR2,0);
            pot2stat=1;
        end
%         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1));
    end
    
    % Go to 90 
    pot1stat = 0;
    pot2stat = 0;
    DriveMotor(0,.3)
    DriveMotor(1,.3)
    while(~pot1stat || ~pot2stat)
        if(a.analogRead(PIN_pot0)<625)
            DriveMotor(MOTOR1,0);
            pot1stat=1;
        end
        if(a.analogRead(PIN_pot1)<525)
            DriveMotor(MOTOR2,0);
            pot2stat=1;
        end
%         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1));
    end
