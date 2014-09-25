% Setup
clear all;
clc
close all;

global r_f theta_f x_f y_f
global er s1_max s2_max L1 L2 atstep
global theta1_min theta2_min theta1_max theta2_max
global MOTOR1 MOTOR2
    
% Initialize boundries of the arm
theta1_max = pi; % from -x axis
theta1_min = 0; % from -x axis
theta2_min = 0; % from +x axis
theta2_max = pi; % from +x axis

% Arm info 
L1 = 9.0;   % Length of inner arm (inches)
L2 = 14.75;  % Length of outer arm (inches)

% Maximum duty to drive the motors
s1_max = 0.8;  % Maximum speed inner pot
s2_max = 0.8;  % Maximum speed outer pot

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
direction = 1;
r_f = sqrt(x_f^2 + y_f^2);
theta_f = atan(y_f/x_f); % in radians
if theta_f < 0
    direction = -1;
    theta_f = pi + theta_f; % from +x axis
end

% current position r_i, theta_i
[r_i,theta_i,theta1,theta2,theta3,x_tip,y_tip,x_in,y_in] = GetArmInfo(); 
[s1,s2] = speeds(x_tip,y_tip,r_i,theta_i);

% fprintf('theta1: %d, theta2: %d, theta3: %d',theta1,theta2,theta3);
fprintf('Raw s1: %d, raw s2: %d\n',s1,s2);

% s1_max, s2_max are given (measured in rad/s)
ratio1 = s1_max / abs(s1); % d(theta)/dt using theta1
ratio2 = s2_max / abs(s2); % d(theta)/dt using theta2

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
X_tip(f) = x_tip;
Y_tip(f) = y_tip;

if direction > 0
    while theta_i >= theta_f
    [s1,s2] = speeds(x_tip,y_tip,r_i,theta_i); 
        
    % s1_max, s2_max are given (measured in rad/s)
    ratio1 = s1_max / abs(s1); % d(theta)/dt using theta1
    ratio2 = s2_max / abs(s2); % d(theta)/dt using theta2
    
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
    X_tip(f) = x_tip;
    Y_tip(f) = y_tip;
    
    % current position r_i, theta_i
    [r_i,theta_i,theta1,theta2,theta3,x_tip,y_tip,x_in,y_in] = GetArmInfo();
    end
else
    while theta_i <= theta_f
    [s1,s2] = speeds(x_tip,y_tip,r_i,theta_i); 
    
    % s1_max, s2_max are given (measured in rad/s)
    ratio1 = s1_max / abs(s1); % d(theta)/dt using theta1
    ratio2 = s2_max / abs(s2); % d(theta)/dt using theta2
    
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
    X_tip(f) = x_tip;
    Y_tip(f) = y_tip;
    
    % current position r_i, theta_i
    [r_i,theta_i,theta1,theta2,theta3,x_tip,y_tip,x_in,y_in] = GetArmInfo();
    end
end

disp('done');
DriveMotor(MOTOR1,0)
DriveMotor(MOTOR2,0)

plotArm(X_tip,Y_tip);