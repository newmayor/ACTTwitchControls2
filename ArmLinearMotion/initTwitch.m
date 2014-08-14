function initTwitch()

    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit
    
    delete(instrfind({'Port'},{'COM19'}));
    port='COM19';
    
    % DO NOT CHANGE MOTOR MAX
    % THIS IS SETS THE MAX VOLTAGE TO MOTORS
    MOTORMAX = 157; % 
    MOTOR1 = 0;
    MOTOR2 = 1;
    % Motor 1
    PIN_motor1_en=4;
    PIN_motor1_pwm1=5;
    PIN_motor1_pwm2=6;

    % Motor 2
    PIN_motor2_en=8;
    PIN_motor2_pwm1=9;
    PIN_motor2_pwm2=10;


    % Potentiometer 1
    PIN_pot0=0;
    PIN_pot1=1;
    
    Pot0_LLimit = 290;
    Pot0_RLimit = 1020;
    Pot1_LLimit = 140;
    Pot1_RLimit = 870;
    Pot0_Center = 670;
    Pot1_Center = 495;

    %-- connect to the board 
    a = arduino(port);


    % Set pin direction
    a.pinMode(PIN_motor1_en,'output');
    a.pinMode(PIN_motor1_pwm1,'output');
    a.pinMode(PIN_motor1_pwm2,'output');

    a.pinMode(PIN_motor2_en,'output');
    a.pinMode(PIN_motor2_pwm1,'output');
    a.pinMode(PIN_motor2_pwm2,'output');
    
% init motors disabled
a.digitalWrite(PIN_motor1_en, 1);
a.digitalWrite(PIN_motor2_en, 1);

% init motors at zero duty
a.analogWrite(PIN_motor1_pwm1, 0);
a.analogWrite(PIN_motor1_pwm2, 0);
a.analogWrite(PIN_motor2_pwm1, 0);
a.analogWrite(PIN_motor2_pwm2, 0);
