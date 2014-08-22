function twitch(s1,s2)

global er s1max s2max atstep
global t1min t2min t1max t2max
global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot1 PIN_pot2

% s1 = 2*s1;
% s2 = 2*s2;
    
[t1,t2,x2,y2,x1,y1] = GetArmInfo();

if(abs(s1max) < abs(s1))    
% Check to make sure speed limit is not exceeded
    if(s1 < 0)
        s1 = -s1max;
    else
        s1 = s1max;
    end
end

if(abs(s2max) < abs(s2))    
% Check to make sure speed limit is not exceeded
    if(s2 < 0)
        s2 = -s2max;
    else
        s2 = s2max;
    end
end

% Make sure that the motor arm positions are within range
if((t1 < t1min) && (s1 < 0))
    % fprintf('t1: %2.2f t1min: %2.2f s1: %2.2f\n',t1,t1min,s1)
    er = 1
elseif((t1 > t1max) && (s1 > 0))
    er = 2
elseif((t2 > t2max) && (s2 > 0))
    er = 3
elseif((t2 < t2min) && (s2 < 0))
    er = 4
end

if(er < 1)    
    DriveMotor(MOTOR1,-1 * s1)
    DriveMotor(MOTOR2,-1 * s2)
    
    % Determines where the next angle should be
    t1 = t1 + s1*atstep;
    t2 = t2 + s2*atstep;
    
    lx = [0,x1,x2];
    ly = [0,y1,y2];
    plot(x1,y1,'O',x2,y2,'O',0,0,'O',lx,ly);
    axis([-24 24 -24 24]);
    axis('square');
    set(gcf,'color','w');
    grid on;
else
    DriveMotor(MOTOR1,0)
    DriveMotor(MOTOR2,0)
    error('There is a bounds error')
end

tt1 = t1; % this will be used when the actual arm is working (ignore for now)
tt2 = t2;  % this will be used when the actual arm is working (ignore for now)

pause(0.003);  % this pause enables animation to happen