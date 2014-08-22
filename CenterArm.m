function CenterArm()
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot1 PIN_pot2

DriveMotor(0,.5)
DriveMotor(1,.5)
%initializes the arm position at the start of the simulation
% sweep the range of motion
    pot1stat = 0;
    pot2stat = 0;
    while(~pot1stat || ~pot2stat)
        if(a.analogRead(PIN_pot1)<500)
            DriveMotor(MOTOR1,0);
            pot1stat=1;
        end
        if(a.analogRead(PIN_pot2)<400)
            DriveMotor(MOTOR2,0);
            pot2stat=1;
        end
%         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot1),a.analogRead(PIN_pot2));
    end
    pot1stat = 0;
    pot2stat = 0;
    DriveMotor(0,-.5)
    DriveMotor(1,-.5)
    while(~pot1stat || ~pot2stat)
        if(a.analogRead(PIN_pot1)>700)
            DriveMotor(MOTOR1,0);
            pot1stat=1;
        end
        if(a.analogRead(PIN_pot2)>600)
            DriveMotor(MOTOR2,0);
            pot2stat=1;
        end
%         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot1),a.analogRead(PIN_pot2));
    end
    
    % Go to 90 
    pot1stat = 0;
    pot2stat = 0;
    DriveMotor(0,.5)
    DriveMotor(1,.5)
    while(~pot1stat || ~pot2stat)
        if(a.analogRead(PIN_pot1)<625)
            DriveMotor(MOTOR1,0);
            pot1stat=1;
        end
        if(a.analogRead(PIN_pot2)<525)
            DriveMotor(MOTOR2,0);
            pot2stat=1;
        end
%         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot1),a.analogRead(PIN_pot2));
    end