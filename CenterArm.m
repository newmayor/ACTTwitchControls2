% Parameters:None Required.
% Results: The arm sweeps its range of motion then returns to the 90 degree
% mark.
% Description: Global variables declared. Function DriveMotor()is called to 
% initialize the arms position. The pots are adjusted by the arduino. The
% arm sweeps the range of motion. The motor is run once more to go to the 90 
% degree position by calling the function DriveMotor().The pot statuses are 
% changed again and the arm moves.

function CenterArm()

global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot0 PIN_pot1 PIN_pot2 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit Pot1_RLimit Pot1_LLimit

DriveMotor(0,0.5)
DriveMotor(1,0.5)

% initializes the arm position at the start of the simulation
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
end
    
% Go to 90 degrees
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
end
%}