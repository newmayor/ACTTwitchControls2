function initTwitch()

global a MOTOR0 MOTOR1 MOTORMAX PIN_motor0_en PIN_motor0_pwm1 PIN_motor0_pwm2 PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_pot0 PIN_pot1

delete(instrfind({'Port'},{'/dev/tty.usbmodem1411'}));
port = '/dev/tty.usbmodem1411';


MOTORMAX = 157;
MOTOR0 = 0;
MOTOR1 = 1;

% Motor 0
PIN_motor0_en = 4;
PIN_motor0_pwm1=5;
PIN_motor0_pwm2=6;

% Motor 1
PIN_motor1_en=8;
PIN_motor1_pwm1=9;
PIN_motor1_pwm2=10;

% Potentiometer 1
PIN_pot0=0;
PIN_pot1=1;

% Connect to the board 
a = arduino(port);

% Set pin direction
a.pinMode(PIN_motor0_en,'output');
a.pinMode(PIN_motor0_pwm1,'output');
a.pinMode(PIN_motor0_pwm2,'output');

a.pinMode(PIN_motor1_en,'output');
a.pinMode(PIN_motor1_pwm1,'output');
a.pinMode(PIN_motor1_pwm2,'output');

% init motors disabled
a.digitalWrite(PIN_motor0_en, 1);
a.digitalWrite(PIN_motor1_en, 1);

% init motors at zero duty
a.analogWrite(PIN_motor0_pwm1, 0);
a.analogWrite(PIN_motor0_pwm2, 0);
a.analogWrite(PIN_motor1_pwm1, 0);
a.analogWrite(PIN_motor1_pwm2, 0);