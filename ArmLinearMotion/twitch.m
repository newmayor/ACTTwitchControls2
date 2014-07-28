function [ x2, y2, tt1, tt2 ] = twitch( dt1, dt2,atstep)

    global er dt1max dt2max %atstep
    global t1min t2min t1max t2max
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot1 PIN_pot2

	
    
% This is the starting info of the arm
[tt1, tt2, x2, y2 ,x1, y1] = GetArmInfo();


if(abs(dt1max) < abs(dt1))    
%checks to make sure speed limit is not exceeded
    if(dt1 < 0)
        dt1 = -dt1max;
    else
        dt1 = dt1max;
    end
end

if(abs(dt2max) < abs(dt2))    
%checks to make sure speed limit is not exceeded
    if(dt2 < 0)
        dt2 = -dt2max;
    else
        dt2 = dt2max;
    end
end



% if statements to make sure that the motor arm positions are within range
%modify the limits to 
if((t1 < t1min) && (dt1 < 0))
    %fprintf('t1: %2.2f t1min: %2.2f dt1: %2.2f\n',t1,t1min,dt1)
    er = 1
elseif((t1 > t1max) && (dt1 > 0))
    er = 2
elseif((t2 > t2max) && (dt2 > 0))
    er = 3
elseif((t2 < t2min) && (dt2 < 0))
    er = 4
end


if(er < 1)    
    DriveMotor(MOTOR1,dt1/dt1max)
    DriveMotor(MOTOR2,dt2/dt2max)
	
	plotArm();
else
    DriveMotor(MOTOR1,0)
    DriveMotor(MOTOR2,0)
    error('There is a bounds error')
end


pause(0.003);  %this pause enables animation to happen


end