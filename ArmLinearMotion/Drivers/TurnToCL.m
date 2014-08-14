function timeElapsed = turnToCL(varargin)
    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit

    if(nargin == 4)
%         fprintf('turnTo: %i\n',nargin)
        [Motor,desPosition, errMargin,minspeed]=varargin{:};
    elseif(nargin == 3)
%         fprintf('turnTo: %i\n',nargin)
        [Motor,desPosition, errMargin]=varargin{:};
        minspeed = 0.3;
    elseif(nargin==2)
%         fprintf('turnTo: %i\n',nargin)
        [Motor,desPosition]=varargin{:};
        errMargin=10;
        minspeed = 0.3;
    else % Function called with no arguments
%         fprintf('turnTo: %i\n',nargin)
        Motor=MOTOR1;
        desPosition = Pot0_Center;
        errMargin = 10;
        minspeed = 0.3;
    end
        
    minVL = minspeed;
    minVR = -1*minspeed;
    curPosition =  a.analogRead(Motor);
    delta = desPosition - curPosition;

    % Measure time for calibration
    tic();
    while(abs(delta) > errMargin)
        
        if(delta > 0) % Turn to the Right
           DriveMotor(Motor, minVR)
%         fprintf('Right: curPos = %i \t delta = %i\n',curPosition,delta)
        else
           DriveMotor(Motor, minVL)
%         fprintf('Left: curPos = %i \t delta = %i\n',curPosition,delta)
        end
        curPosition =  a.analogRead(Motor);
        delta = desPosition - curPosition;
%         fprintf('curPos = %i \t delta = %i\n',curPosition,delta)
        
        %armspeed = ArmSpeed(MOTOR1)
    end
    
    timeElapsed=toc(); 
    
    DriveMotor(Motor,0)
    curPosition =  a.analogRead(Motor);
      