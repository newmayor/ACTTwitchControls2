
global a MOTOR1 MOTOR2 PIN_pot1 PIN_pot2

MinVoltage = 20;
MaxVoltage = 0;

InitialDuty = 0;
MaxDuty = 1;
DutyStep = 0.1;  % half volt increments

% leave these angle boundary conditions in units of degrees since
% conversion from pot resistance values to degrees is done when storing
% pot1 value in code below
pot1Min = 0;
pot1Max = 180;
pot2Min = 0;
pot2Max = 180;

t1min = 260;
t1max = 990;
t2min = 180;
t2max = 890;


duty = InitialDuty;

% Initialization of the arm positions
pot1 = (a.analogRead(PIN_pot1)-t1min)/(t1max-t1min)*180-90;
pot1_buffer = 0.05*pot1; % let buffer resistance value be 5% of pot read value

% while pot1 read value is greater than -95 percent of minimum pot value, proceed with
% following logic statement
% Motor movement direction may not be correct
while pot1 >= pot1Min-pot1_buffer
    DriveMotor(MOTOR1, -0.5);
    pot1 = (a.analogRead(PIN_pot1)-t1min)/(t1max-t1min)*180-90;
end
DriveMotor(MOTOR1, 0);

pot2 = (a.analogRead(PIN_pot2)-t2min)/(t2max-t2min)*180-90;
pot2_buffer = 0.05*pot2; % let buffer resistance value be 5% of pot read value
while pot2 >= pot2Min-pot2_buffer
    DriveMotor(MOTOR2, -0.5);
    pot1 = (a.analogRead(PIN_pot2)-t2min)/(t2max-t2min)*180-90;
end
DriveMotor(MOTOR2, 0);


timeValues = zeros(size(11,4));
% Beginning of the test loop
for duty = 0:0.1:1
    i = 0;
    
    
    % Joint 1: Forward Direction
    tic
    while pot1 < pot1Max-pot1_buffer
        DriveMotor(MOTOR1, duty);
        pot1 = (a.analogRead(PIN_pot1)-t1min)/(t1max-t1min)*180-90;
    end
    DriveMotor(MOTOR1, 0);
    time = toc;
    fprintf('Joint 1 (forward motion) time elapsed: %d seconds using a %d duty cycle\n\n', time, duty)
    timeValues(i,1) = time; % store time value
    
    
    % Joint 2: Forward Direction
    tic
    pot2_buffer = 0.05*pot2; % let buffer resistance value be 5% of pot read value
    while pot2 < pot2Max-pot2_buffer
        DriveMotor(MOTOR2, duty);
        pot1 = (a.analogRead(PIN_pot2)-t2min)/(t2max-t2min)*180-90;
    end
    DriveMotor(MOTOR2, 0);
    time = toc;
    fprintf('Joint 2 (forward motion) time elapsed: %d seconds using a %d duty cycle\n\n', time, duty)
    timeValues(i,2) = time; % store time value
    
    
    % Joint 1: Reverse Direction
    tic
    while pot1 > pot1Min+pot1_buffer
        DriveMotor(MOTOR1, duty);
        pot1 = (a.analogRead(PIN_pot1)-t1min)/(t1max-t1min)*180-90;
    end
    DriveMotor(MOTOR1, 0);
    time = toc;
    fprintf('Joint 1 (backward motion) time elapsed: %d seconds using a %d duty cycle\n\n', time, duty)
    timeValues(i,3) = time; % store time value
    
    
    % Joint 2: Reverse Direction
    tic
    pot2_buffer = 0.05*pot2; % let buffer resistance value be 5% of pot read value
    while pot2 > pot2Min+pot2_buffer
        DriveMotor(MOTOR2, -duty);
        pot1 = (a.analogRead(PIN_pot2)-t2min)/(t2max-t2min)*180-90;
    end
    DriveMotor(MOTOR2, 0);
    time = toc;
    fprintf('Joint 2 (backward motion) time elapsed: %d seconds using a %d duty cycle\n\n', time, duty)
    timeValues(i,4) = time; % store time value
    
    
    
    i = i+1;
end
