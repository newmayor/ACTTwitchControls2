
MinVoltage = 20;
MaxVoltage = 0;

InitialDuty = 0; 
MaxDuty = 1;
DutyStep = 0.1;  % half volt increments

pot1Min = 0;     % MUST BE CONVERTED FROM DEG TO POT READING VALUES
pot1Max = 180;   % Theses values will be will not be round values
pot2Min = 0;     %  obtain true values from testing arm positions.
pot2Max = 180;

duty = InitialDuty;

% Initialization of the arm positions
pot1 = analogRead(POT1PIN);  % Correct the Pin Value
if pot1 == pot1Min    % Add a buffer +/- a small amount
else
    DriveMotor(Motor1, -0.5);   % Motor movement direction may not be correct
    while pot1 > pot1Min
        pot1 = analogRead(POT1PIN);
    end
    DriveMotor(Motor1, 0);
end

pot2 = analogRead(POT2PIN);  % Correct the Pin Value
if pot2 == pot2Min    % Add a buffer +/- a small amount
else
    DriveMotor(Motor2, -0.5);   % Motor movement direction may not be correct
    while pot2 > pot2Min
        pot2 = analogRead(POT2PIN);
    end
    DriveMotor(Motor2, 0);
end


% Begining of the test loop
while duty <= MaxDuty
    % Arm 1: Forward Direction
    tic
    DriveMotor(Motor1, duty);   % Motor movement direction may not be correct
    while pot1 < pot1Max
        pot1 = analogRead(POT1PIN);
    end
    DriveMotor(Motor1, 0);
    time = toc;
    
    disp('Arm 1');
    disp(duty);
    disp(time);
    
    % Arm 2: Forward Direction 
    tic
    DriveMotor(Motor2, duty);   % Motor movement direction may not be correct
    while pot2 < pot2Max
        pot1 = analogRead(POT2PIN);
    end
    DriveMotor(Motor2, 0);
    time = toc;
    
    disp('Arm 2');
    disp(duty);
    disp(time);
    
    
     % Arm 1: Reverse Direction    
        tic
    DriveMotor(Motor1, -duty);   % Motor movement direction may not be correct
    while pot1 > pot1Min
        pot1 = analogRead(POT1PIN);
    end
    DriveMotor(Motor1, 0);
    time = toc;
    
    disp('Arm 1');
    disp(duty);
    disp(time);
    
    % Arm 2: Reverse Direction     
    tic
    DriveMotor(Motor2, -duty);   % Motor movement direction may not be correct
    while pot2 > pot2Min
        pot1 = analogRead(POT2PIN);
    end
    DriveMotor(Motor2, 0);
    time = toc;
    
    disp('Arm 2');
    disp(duty);
    disp(time);
    
    
    duty = duty + DutyStep;
end
