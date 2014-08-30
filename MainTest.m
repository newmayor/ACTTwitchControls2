% Setup
clear all;
clc
close all;

global er s1_max s2_max x_tip y_tip L1 L2 atstep
global theta1_min theta2_min theta1_max theta2_max
global MOTOR1 MOTOR2
    
% Initialize boundries of the arm
% 100 degrees to the left and right of the perpendicular from horizontal 
theta1_max = (2 * pi) - 100*pi/180;
theta1_min = 100*pi/180;
theta2_max = (2 * pi) - 100*pi/180;
theta2_min = 100*pi/180;

% Arm info 
L1 = 9.0;   % Length of inner arm (inches)
L2 = 14.75;  % length of outer arm (inches)

% Maximum duty to drive the motors
s1_max = 0.8;  % maximum speed inner pot
s2_max = 0.8;  % maximum speed outer pot

atstep = .1; 
adstep = .1;

er = 0;        % er check, if == 1 then there is something wrong
f = 1;   %counter and index for the number of times arm_bebe function was acessed

% Starts the connection with arduino and initializes the pinouts
initTwitch()

% Reset to default position
disp('Setting arm to the default position')
CenterArm()

% initialize final cartesian position
x_f  = input('Input the target X coordinate: ');
y_f = input('Input the target Y coordinate: ');

% convert x_f, y_f to r_f, theta_f
r_f = sqrt(x_f^2 + y_f^2);
theta_f = atan(y_f/x_f); % in radians

% current position r_i, theta_i
[theta1,theta2,theta3,x_tip,y_tip] = GetArmInfo(); 
[r_i,theta_i] = position(theta1,theta2);
[s1,s2] = speeds(r_i,r_f,theta_i,theta_f);

% fprintf('theta1: %d, theta2: %d, theta3: %d',theta1,theta2,theta3);
fprintf('Raw s1: %d, raw s2: %d\n',s1,s2);

% s1_max, s2_max are given (measured in rad/s)
ratio1 = s1_max / s1; % d(theta)/dt using theta1
ratio2 = s2_max / s2; % d(theta)/dt using theta2

% use the smaller ratio
if ratio1 < ratio2
    max = ratio1;
else
    max = ratio2;
end

s1 = s1 * max; % d(theta1)/dt
s2 = s2 * max; % d(theta2)/dt

fprintf('Reduced s1: %d, reduced s2:%d\n',s1,s2);

% drive motors at s1 and s2
twitch(s1,s2);
hold on;

line([x_tip x_f],[y_tip y_f])

% record the points traversed
X(f) = x_tip;
Y(f) = y_tip;

while theta_i >= theta_f
    [s1,s2] = speeds(r_i,r_f,theta_i,theta_f); 
    
    % disp(s1); disp(s2);
    
    % s1_max, s2_max are given (measured in rad/s)
    ratio1 = s1_max / s1; % d(theta)/dt using theta1
    ratio2 = s2_max / s2; % d(theta)/dt using theta2
    
    % use the smaller ratio
    if ratio1 < ratio2
        max = ratio1;
    else
        max = ratio2;
    end
    
    s1 = s1 * max; % d(theta1)/dt
    s2 = s2 * max; % d(theta2)/dt
        
    % drive motors at s1 and s2
    twitch(s1,s2);
    hold on;

    line([x_tip x_f],[y_tip y_f])

    % record the points traversed
    X(f) = x_tip;
    Y(f) = y_tip;
    
    % current position r_i, theta_i
    [theta1,theta2,theta3,x_tip,y_tip] = GetArmInfo(); 
    [r_i,theta_i] = position(theta1,theta2);
end

disp('done');
DriveMotor(MOTOR1,0)
DriveMotor(MOTOR2,0)

hold on;
plot(X,Y);  %plots the path taken by the outer arm
axis([-24 24 -24 24]);
axis('square');
set(gcf,'color','w');
grid on;