function initTwitch()

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

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