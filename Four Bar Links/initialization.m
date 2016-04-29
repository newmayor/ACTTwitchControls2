global a
global L2 L3 theta1 theta4 x_i y_i x_f y_f 
global er_ori curr_ori target_ori
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global motor1 motor2 motor_max
global pin_motor1_en pin_motor2_en pin_motor1_pwm1 pin_motor2_pwm1 pin_motor1_pwm2 pin_motor2_pwm2
global pin_pot1 pin_pot2

% Arm info 
L2 = 9.0;   % Length of inner arm (inches)
L3 = 14.75;  % Length of outer arm (inches)
theta1 = 0; % Angle of the horizontal imaginary arm (radians)
theta4 = pi/2; % Angle of the vertical imaginary arm (radians)
x_i = 0; 
y_i = L2 + L3;

% Boundries of the arm
theta2_min = 170;
theta2_max = 882;
theta3_min = 195; % Changed from 195 to 194
theta3_max = 927;

% Maximum speeds to drive the motors
s2_max = 0.8;  % Maximum speed of inner pot
s3_max = 0.8;  % Maximum speed of outer pot

% Starts the connection with arduino and initializes the pinouts
connect(); % Formerly init_twitch

% % Reset to default position
% disp('Setting arm to the default position');
center_arm();