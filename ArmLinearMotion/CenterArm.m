%% Centers the arm 
% Sweep Left, Right, Then return to Center

function CenterArm()
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit

TurnTo(MOTOR1,600,1)
TurnTo(MOTOR1,700,1)
TurnTo(MOTOR1,Pot0_Center,1)
TurnTo(MOTOR2,500,1)
TurnTo(MOTOR2,600,1)
TurnTo(MOTOR2,Pot1_Center,1)


% DriveMotor(0,.5)
%         pause(.001)
% DriveMotor(1,.5)
% %initializes the arm position at the start of the simulation
% % sweep the range of motion
%     pot1stat = 0;
%     pot2stat = 0;
%     while(~pot1stat || ~pot2stat)
%         if(a.analogRead(PIN_pot0)<550)
%             DriveMotor(MOTOR1,0);
%             pot1stat=1;
%         end
%         if(a.analogRead(PIN_pot1)<450)
%             DriveMotor(MOTOR2,0);
%             pot2stat=1;
%         end
%         fprintf('1:  pot1: %i  pot2: %i\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1));
%         pause(.001)
%    end
%     pot1stat = 0;
%     pot2stat = 0;
%     DriveMotor(0,-.5)
%         pause(.001)
%     DriveMotor(1,-.5)
%     while(~pot1stat || ~pot2stat)
%         if(a.analogRead(PIN_pot0)>700)
%             DriveMotor(MOTOR1,0);
%             pot1stat=1;
%         end
%         if(a.analogRead(PIN_pot1)>600)
%             DriveMotor(MOTOR2,0);
%             pot2stat=1;
%         end
%         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1));
%         pause(.001)
%     end
%     
%     % Go to 90 
%     pot1stat = 0;
%     pot2stat = 0;
%     DriveMotor(0,.5)
%         pause(.001)
%     DriveMotor(1,.5)
%     while(~pot1stat || ~pot2stat)
%         if(a.analogRead(PIN_pot0)<Pot0_Center)
%             DriveMotor(MOTOR1,0);
%             pot1stat=1;
%         end
%         if(a.analogRead(PIN_pot1)<Pot1_Center)
%             DriveMotor(MOTOR2,0);
%             pot2stat=1;
%         end
% %         fprintf('pot1: %i  pot2: %i\n',a.analogRead(PIN_pot0),a.analogRead(PIN_pot1));
%         pause(.001)
%     end