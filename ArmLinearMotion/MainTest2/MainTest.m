
% Setup
clear all;
clc
close all;
    global er s1max s2max x2i y2i L1 L2 atstep
    global t1min t2min t1max t2max
    global MOTOR1 MOTOR2
    
%% Set Constants and Limits
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

%% Connect with microcontroller
% Starts the connection with arduino and initializes the pinouts
% % % % % initTwitch()


%% Go to default position
% or go to starting position (To be implemented later)
% Reset to default position
disp('Setting arm to the default position')
% % % % % CenterArm()



%% Read in target destination
% initialize final cartesian position
x2f  = input('Input the target X coordinate: ');
y2f = input('Input the target Y coordinate: ');



%% Convert Cartesian Coordinates to polar
%% Problem 1 
% There is no var x_f and y_f so I'm temporarily assigning x_f and y_f  to 
% x2f and y2f to alleve the error
x_f = x2f;
y_f = y2f;
%%

% Final destination
% convert x_f, y_f to r_f, theta_f
r_f = sqrt(x_f^2 + y_f^2);
theta_f = atan(y_f/x_f);

% Calculate current positions in radians 
% Current position r_i, theta_i
%[theta1,theta2,x2i,y2i,x1i,y1i] = GetArmInfo()
%%%theta1 = theta1 * pi / 180;
%%%theta2 = theta2 * pi / 180;
theta1 = 90 * pi / 180;
theta2 = 0 * pi / 180;
[r_i,theta_i] = position(theta1,theta2)


[s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2)

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
[x2old,y2old,t1old,t2old] = twitch(s1,s2);

while theta_i ~= theta_f
    [s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2); 
    
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
    [x2old,y2old,t1old,t2old] = twitch(s1,s2);
    
    fprintf('dt1: %2.2f  dt2: %2.2f\n',s1,s2);
    hold on;

    line([x2i x2f],[y2i y2f])

    % record the points traversed
    X(f) = x2i;
    Y(f) = y2i;
    
    % current position r_i, theta_i
    [theta1,theta2,x2i,y2i,x1i,y1i] = GetArmInfo(); 
    theta1 = theta1 / (2*pi) * 360;
    theta2 = theta2 / (2*pi) * 360;
    [r_i,theta_i] = position(theta1,theta2);
end 








%{
% distance from current position to final position
dist = sqrt((y2f - y2i)^2 + (x2f - x2i)^2);

ty = (y2f - y2i)/dist;
tx = (x2f - x2i)/dist;

% Calculate the next point in the line of travel towards the final point
y2new = adstep*(ty)+y2i;
x2new = adstep*(tx)+x2i;
    r = sqrt(x2new^2 + y2new^2);
    theta = acos(x2new/r);    
    t2new = pi - acos((r^2 - L1^2 - L2^2)/(-2*L1*L2));
    tin = acos((L2^2 - r^2 - L1^2)/(-2*L1*r));
    t1new = (pi/2 - theta) - tin;

dt1 = t1new - t1old;
dt2 = t2new - t2old;

while(dist >= 1.0)
    [x2old, y2old,t1old,t2old] = twitch(dt1,dt2);
    f = f+1;
    X(f) = x2old;
    Y(f) = y2old;
        
    dist = sqrt((y2f - y2old)^2 + (x2f - x2old)^2);
    ty = (y2f - y2old)/dist;
    tx = (x2f - x2old)/dist;
    y2new = (adstep*f)*(ty)+y2i;
    x2new = (adstep*f)*(tx)+x2i;
        
    r = sqrt(x2new^2 + y2new^2);
    theta = acos(x2new/r);
    t2new = pi - acos((r^2 - L1^2 - L2^2)/(-2*L1*L2));
    tin = acos((L2^2 - r^2 - L1^2)/(-2*L1*r));
    t1new = (pi/2 - theta) - tin;    

    %fprintf('t1new: %2.2f  t1old: %2.2f\n',t1new,t1old)
    %fprintf('t2new: %2.2f  t2old: %2.2f\n',t2new,t2old)
            
    dt1 = t1new - t1old;% - X(f-1);    %velocity of motors
    dt2 = t2new - t2old;% - Y(f-1);  
	%fprintf('tt1: %2.2f  tt2: %2.2f\n',tt1,tt2);
    %fprintf('dt1: %2.2f  dt2: %2.2f\n',dt1,dt2)
end
%}








disp('done');
DriveMotor(MOTOR1,0)
DriveMotor(MOTOR2,0)

hold on;
plot(X,Y);  %plots the path taken by the outer arm
axis([-24 24 -24 24]);
axis('square');
set(gcf,'color','w');
grid on;