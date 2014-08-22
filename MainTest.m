% Setup
clear all;
clc
close all;

global er s1max s2max x_i y_i L1 L2 atstep
global t1min t2min t1max t2max
global MOTOR1 MOTOR2
    
% Initialize boundries of the arm
% 100 degrees to the left and right of the perpendicular from horizontal 
t1min = -100*pi/180;
t1max = 100*pi/180;
t2min = -100*pi/180;
t2max = 100*pi/180;

% Arm info 
L1 = 9.0;   % Length of base arm (inches)
L2 = 14.75;  % length of outer arm (inches)

% Maximum duty to drive the motors
s1max = 0.8;  % maximum speed inner pot
s2max = 0.8;  % maximum speed outer pot

atstep = .1; 
adstep = .1;

er = 0;        % error check, if == 1 then there is something wrong
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
[theta1,theta2,x_i,y_i] = GetArmInfo(); 
disp(theta1); disp(theta2);
% theta1 = theta1 * pi / 180; 
% theta2 = theta2 * pi / 180;
[r_i,theta_i] = position(theta1,theta2);
[s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2);

disp(s1); disp(s2);

% s1max, s2max are given (measured in rad/s)
ratio1 = s1max / s1; % d(theta)/dt using theta1
ratio2 = s2max / s2; % d(theta)/dt using theta2

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

while theta_i ~= theta_f
    [s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2); 
    
    % s1_max, s2_max are given (measured in rad/s)
    ratio1 = s1max / s1; % d(theta)/dt using theta1
    ratio2 = s2max / s2; % d(theta)/dt using theta2
    
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
    
    fprintf('dt1: %2.2f  dt2: %2.2f\n',s1,s2);
    hold on;

    line([x_i x_f],[y_i y_f])

    % record the points traversed
    X(f) = x_i;
    Y(f) = y_i;
    
    % current position r_i, theta_i
    [theta1,theta2,x_i,y_i,x,x] = GetArmInfo(); 
    theta1 = theta1 / (2*pi) * 360;
    theta2 = theta2 / (2*pi) * 360;
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