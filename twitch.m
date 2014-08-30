function twitch(s1,s2)

global er s1_max s2_max
global theta1_min theta2_min theta1_max theta2_max
global MOTOR1 MOTOR2
    
[theta1,theta2,theta3,x_tip,y_tip,x_in,y_in] = GetArmInfo();

if(abs(s1_max) < abs(s1))    
% Check to make sure speed limit is not exceeded
    if(s1 < 0)
        s1 = -s1_max;
    else
        s1 = s1_max;
    end
end

if(abs(s2_max) < abs(s2))    
% Check to make sure speed limit is not exceeded
    if(s2 < 0)
        s2 = -s2_max;
    else
        s2 = s2_max;
    end
end

% Make sure that the motor arm positions are within range
if (theta1 < theta1_min) && (s1 < 0)
    er = 1; 
elseif (theta1 > theta1_max) && (s1 > 0)
    er = 2; 
elseif ((theta2 - theta3) > theta2_max) && (s2 > 0)
    er = 3;
elseif ((theta2 - theta3) < theta2_min) && (s2 < 0) 
    er = 4;
end

if er == 0   
    DriveMotor(MOTOR1,-1 * s1)
    DriveMotor(MOTOR2,-1 * s2)
    
    lx = [0,x_in,x_tip];
    ly = [0,y_in,y_tip];
    plot(x_in,y_in,'O',x_tip,y_tip,'O',0,0,'O',lx,ly);
    axis([-30 30 -30 30]);
    axis('square');
    set(gcf,'color','w');
    grid on;
else
    fprintf('theta1: %d, theta1_min: %d, theta1_max: %d\n',theta1,theta1_min,theta1_max);
    fprintf('theta2 - theta3: %d, theta2_min: %d, theta2_max: %d\n',theta2 - theta3,theta2_min,theta2_max);
    fprintf('s1: %d, s2: %d\n',s1,s2);
    
    DriveMotor(MOTOR1,0)
    DriveMotor(MOTOR2,0)
    error('BOUNDS ERROR');
end

pause(0.003);  % this pause enables animation to happen