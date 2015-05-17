function connect()

global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

delete(instrfind({'Port'},{'/dev/tty.usbmodem1411'}));
port = '/dev/tty.usbmodem1411';

motor_max = 157;
motor1 = 1;
motor2 = 2;

% Motor 0
pin_motor1_en = 4;
pin_motor1_pwm1 = 5;
pin_motor1_pwm2 = 6;

% Motor 1
pin_motor2_en = 8;
pin_motor2_pwm1 = 9;
pin_motor2_pwm2 = 10;

% Potentiometer 1
pin_pot1 = 0;
pin_pot2 = 1;

% Connect to the board 
a = arduino(port);

% Set pin direction
a.pinMode(pin_motor1_en,'output');
a.pinMode(pin_motor1_pwm1,'output');
a.pinMode(pin_motor1_pwm2,'output');

a.pinMode(pin_motor2_en,'output');
a.pinMode(pin_motor2_pwm1,'output');
a.pinMode(pin_motor2_pwm2,'output');

% Init motors disabled
a.digitalWrite(pin_motor1_en, 1);
a.digitalWrite(pin_motor2_en, 1);

% Init motors at zero duty
a.analogWrite(pin_motor1_pwm1, 0);
a.analogWrite(pin_motor1_pwm2, 0);
a.analogWrite(pin_motor2_pwm1, 0);
a.analogWrite(pin_motor2_pwm2, 0);