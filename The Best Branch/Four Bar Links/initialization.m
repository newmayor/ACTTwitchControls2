global L2 L3 theta1 theta4 x_i y_i x_f y_f
global div steps ep
global theta2_min theta3_min theta2_max theta3_max s2_max s3_max
global MOTOR1 MOTOR2

% Arm info 
L2 = 9.0;   % Length of inner arm (inches)
L3 = 14.75;  % Length of outer arm (inches)
theta1 = 0; % Angle of the horizontal imaginary arm (radians)
theta4 = pi/2; % Angle of the vertical imaginary arm (radians)
x_i = 0; y_i = L2 + L3;

% Boundries of the arm
theta2_min = 0; % from -x axis
theta2_max = pi; % from -x axis
theta3_min = 0; % from +x axis
theta3_max = pi; % from +x axis

% Maximum speeds to drive the motors
s2_max = 0.8;  % Maximum speed of inner pot
s3_max = 0.8;  % Maximum speed of outer pot

% Starts the connection with arduino and initializes the pinouts
initTwitch()

% Reset to default position
disp('Setting arm to the default position')
CenterArm()