% Parameters: no inputs needed 
% Results: motor is prepped to be driven 
% Descritption: Function begins by globalizing variables for turning the motors
% on and off (motor1 and motor2) and for the dedicated pins into the arduino 
% for sending commands and receiving information from the pot and motor. Pin locations 
% are set for the motors. Motor 1:PIN_motor1_en=4;PIN_motor1_pwm1=5;
% PIN_motor1_pwm2=6. Motor 2:PIN_motor2_en=8;PIN_motor2_pwm1=9;
% PIN_motor2_pwm2=10. The potentiometer pins are set. Pot 1: PIN_pot1=0;
% PIN_pot2=1. The function connects to the arduino and sets the pins as either
% inputs or outputs.The motors are set to have a zero duty and are disabled

function initTwitch()

global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot1 PIN_pot2

delete(instrfind({'Port'},{'/dev/tty.usbmodem1411'}));
port = '/dev/tty.usbmodem1411';

MOTORMAX = 157;
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
PIN_pot1=0;
PIN_pot2=1;

% Connect to the board 
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