% Parameters: No parameters entered. 
% Results: Intilization of the pin outs to the arduino and the arm is sent to 
% its home position. The user sees a display from the script that tells them
% that the arm is being sent to its home position.
% Descritption:Script declares global variables for the length of the
% upper arm and forearm, the angle of the horizontal imaginary arm, the angle 
% of the vertical arm, the boundaries of the arms, and the maximum speed for the
% pots found in the inner and outer arms and sets their values. The connection with 
% the arduno is established and intializes the pin outs by calling the 
% initTwitch() function. Then the arm is set to its default or home position
% by calling the CenterArm() function and the script diplays to that the arm is
% being sent to its home position.

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