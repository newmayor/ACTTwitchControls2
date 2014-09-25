global L2 L3 theta1 theta4
global x_f y_f
global theta1_min theta2_min theta1_max theta2_max s1_max s2_max
global MOTOR1 MOTOR2

% Arm info 
L2 = 9.0;   % Length of inner arm (inches)
L3 = 14.75;  % Length of outer arm (inches)
theta1 = 0; % Angle of the horizontal imaginary arm (radians)
theta4 = pi/2; % Angle of the vertical imaginary arm (radians)

% Boundries of the arm
theta1_max = pi; % from -x axis
theta1_min = 0; % from -x axis
theta2_min = 0; % from +x axis
theta2_max = pi; % from +x axis

% Maximum speeds to drive the motors
s1_max = 0.8;  % Maximum speed of inner pot
s2_max = 0.8;  % Maximum speed of outer pot

% Starts the connection with arduino and initializes the pinouts
initTwitch()

% Reset to default position
disp('Setting arm to the default position')
CenterArm()