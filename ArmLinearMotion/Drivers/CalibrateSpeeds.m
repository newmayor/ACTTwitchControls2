function [timeElapsed]=CalibrateSpeeds(varargin)
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit
    

    
    if(nargin == 3)
%         fprintf('CalibrateSpeeds: %i\n',nargin)
        [Motor, errMargin,minspeed]=varargin{:};
    elseif(nargin == 2)
%         fprintf('CalibrateSpeeds: %i\n',nargin)
        [Motor, errMargin]=varargin{:};
        minspeed = 0.3;
    elseif(nargin==1)
%         fprintf('CalibrateSpeeds: %i\n',nargin)
        [Motor]=varargin{:};
        errMargin=10;
        minspeed = 0.3;
    else % Function called with no arguments
%         fprintf('CalibrateSpeeds: %i\n',nargin)
        Motor=MOTOR1;
        desPosition = Pot0_Center;
        errMargin = 10;
        minspeed = 0.3;
    end
    
    %% Determine the speed
    % Measure the time it takes to move 1 rad
    % Be sure to comment out the call to ArmSpeed in turnTo
    disp('Beginning Calibration')
    
    if(Motor == MOTOR1)
        LLlim = Pot0_LLimit;
        RLim = Pot0_RLimit;
    elseif(Motor == MOTOR2)
        LLlim = Pot1_LLimit;
        RLim = Pot1_RLimit;
    end
    % Motor0
    TurnTo(Motor,LLlim+100,errMargin,.8);
    TurnTo(Motor,LLlim,errMargin,.25);
    pause(.25)
    timeElapsed=TurnTo(Motor, RLim,errMargin,minspeed);
%     timeElapsed=toc()