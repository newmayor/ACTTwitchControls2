function [ ] = LinearMotion(Xf, Yf)
% Purpose:  To move the arm point from its current positon to a final 
%           coordiante position by means of a straight line path at a 
%           constant velocity
% Given:    x and y coordinates of desired final position
% Output:   theta1 and theta2
%
%
% ***********************************************************************
%   Explination of X & Y Variable Names
%     X & Y - Current coordinates for the actual arm
%     Xi & Yi - Initial coordinates for the both actual arm and theoretical arm path
%     Xf & Yf - Final coordiantes for the theoretical arm path
%     Xs & Ys - Step coordinates for the theoretical arm path
% ***********************************************************************
%   Explination of Theta Variable Names
%    theta1 & theta2 - Current angular coordinates for the actual arm
%    s_theta1 & s_theta2 - Angular coordinates for the step along the path line
%    d_theta1 & d_theta2 - Difference between step angles and current angles
% *********************************************************************** 
%   Explination of Flag Variable
%    PosFlag
%       0 - Denotes that the final position has not been reached, yet.
%       1 - Denotes that the final postion has been reached
%    SlopeFlag
%       1 - Positive straigth line path slope, with an ascending direction of motion
%       2 - Positive straigth line path slope, with an descending direction of motion
%       3 - Negative straigth line path slope, with an ascending direction of motion
%       3 - Negative straigth line path slope, with an descending direction of motion
% ***********************************************************************      
clc
global R1 R2 

PosFlag = 0;        % Runtime flag to determine if arm reaches final position
SlopeFlag = 0;      % Flag to determine if straight line path has a positive (1) or negative (2) slope

R1 = 12;            % Length of upper arm (in)           
R2 = 18;            % Length of forearm (in)

speed = 1;          % Straight line traveling speed (in/sec)
TimeStep = 0.020;   % Time difference for each step (sec)

Xi = 15;            % X-Position of the Arm (in)
Yi = 6;             % Y-Position of the Arm (in)
% % This code will replace above initial values when connected witht the arm [Needs Revision]
%[Xi, Yi] = PositionRead(1);

%%%% Possible error due to horozontal or verticle straigt line motion                                
if ((Xf > Xi) && (Yf > Yi))       % Positive slope, ascending motion
    SlopeFlag = 1;          
elseif ((Xi > Xf) && (Yi > Yf))   % Positive slope, descending motion
    SlopeFlag = 2;        
elseif ((Yf > Yi) && (Xi > Xf))   % Negative slope, ascending motion
    SlopeFlag = 3;          
elseif ((Yi > Yf) && (Xf > Xi))   % Negative slope, descending motion
    SlopeFlag = 4;        
end

TotDist = sqrt((Yf-Yi)^2+(Xf-Xi)^2);        % Distance beween Initial and Final points
NumSteps = TotDist/(speed*TimeStep);      % Number of steps between initial and final for a given time variable (to match simulation) 
StepDist = TotDist/NumSteps;                % Distance along the straign line path for the given time step

step = 0;                   % Sets step count to zero for the loop
while PosFlag ~= 1          % Runs untill the Final position is reached
    
    if step == 0            % Increments the step for the first run
        X = Xi;
        Y = Yi;
        step = step+1;        
    
    elseif step == NumSteps     % Checks if the final position has been reached
        PosFlag = 1;               % Final postion has been reached, ends code
    
    else
        d = step*StepDist;
        if SlopeFlag == 1   % Cacluations for the X,Y coordinates for the step along the straight line path
            Xs = ((d*(Xf-Xi))/(TotDist))+Xi;
            Ys = ((d*(Yf-Yi))/(TotDist))+Yi;
        elseif SlopeFlag == 2
            Xs = ((-d*(Xi-Xf))/(TotDist))+Xi;
            Ys = ((-d*(Yi-Yf))/(TotDist))+Yi;
        elseif SlopeFlag == 3
            Xs = ((-d*(Xi-Xf))/(TotDist))+Xi;
            Ys = ((d*(Yf-Yi))/(TotDist))+Yi;          
        elseif SlopeFlag == 4
            Xs = ((d*(Xf-Xi))/(TotDist))+Xi;
            Ys = ((-d*(Yi-Yf))/(TotDist))+Yi;            
        end     
        
        %%%% Possible error due to +/- sign assignment
        s_theta2 = atan(Ys/Xs)-acos((Xs^2+Ys^2+R2^2-R1^2)/(2*R2*sqrt(Xs^2+Ys^2)));
        s_theta1 = acos((Xs-R2*cos(s_theta2))/R1);
        
        % Needed for Simulation
        theta2 = atan(Y/X)-acos((X^2+Y^2+R2^2-R1^2)/(2*R2*sqrt(X^2+Y^2)));
        theta1 = acos((X-R2*cos(s_theta2))/R1);
        
        % Needed for Actual Arm
        %[theta1, theta2] = PostionRead(2);        % Reads current angular position
        
        d_theta1 = s_theta1 - theta1;
        d_theta2 = s_theta2 - theta2;
       
        omega1 = d_theta1/TimeStep;
        omega2 = d_theta2/TimeStep;
        
        %Needed for Simulation
        [ X, Y, t1, t2 ] = arm_bebe(omega1,omega2);
        
        step = step+1;
    end
    
    
end

end
