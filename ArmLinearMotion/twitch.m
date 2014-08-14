function [ x2, y2, tt1, tt2 ] = twitch( dt1, dt2)

    global er dt1max dt2max %atstep
    global t1min t2min t1max t2max
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit

	
    
% This is the starting info of the arm
[tt1, tt2, x2, y2 ,x1, y1] = GetArmInfo();


pos1=a.analogRead(0)
pos2=a.analogRead(1)

if(50>pos1||pos1>1023||50>pos2||pos2>1000)
    er = 1
end



er = 0;
if(er < 1)    
    TurnAt(MOTOR1,dt1);%/dt1max)
    TurnAt(MOTOR2,dt2);%/dt2max)
	
	plotArm();
else
    DriveMotor(MOTOR1,0)
    DriveMotor(MOTOR2,0)
    error('There is a bounds error')
end




end