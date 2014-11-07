function constLinearMotion( TargetX, TargetY )
% Motion Function:
% Epislon Function - Using new step dimensions for movement control
% Simulation2.0 - To populate a movement position array (without error  procedures
% Motion Loop - goes through each of the movements array coordinates
%     Determines the delta theta of the current position and the desired next position 
%         on the linear path
%     Runs motors for a certain time duration to move are to new position 
%     Repeats loop until final position is reached

global L2 L3 theta1 theta4 x_i y_i x_f y_f
global div steps ep
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

epislon(StepSize);    % Change Epislon so that its input_args = the div sizes
movePos = simulation2(TargetX, TargetY);    % Copy and paste form simulation.m, change so that output 
                            %   is the movement position matrix or it is global
[m,n]=size(movePos); % Gives the dimensions of the matrix with all the linear path coordinates
x=1;     % Assuming the first position is in row 1 (not 0) of the matrix   

while(x~=m)
   [CurrentTheta2, CurrentTheta3] = ThetasFormThePOTS();  %We know where the arm currently is
    
   [theta2_1,theta3_1,theta2_2,theta3_2] = next_thetas(movePos(x,1),movePos(x,2));
    if (DeisredOrientation == 1)
        NextTheta2 = theta2_1;
        NextTheta3 = theta3_1;
    elseif (DesiredOrientation == 2)
        NextTheta2 = theta2_2;
        NextTheta3 = theta3_2;
    else
        error('constLinearMotion','Can not determime which orientation angles to use.')
    
    DeltaTheta2 = NextTheta2 - CurrentTheta2;
    DeltaTheta3 = NextTheta3 - CurrentTheta3;
        
    MotorsON(DeltaTheta2, DeltaTheta3);   % Calculates voltage and runs motors
    delay(time);           % Allows motors to run for appropriate time for each step
    MotorsOFF();           % Voltage to motors ZERO
    x=x+1;
end


end

