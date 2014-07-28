
% Setup
clear all;
clc
close all;
    global er dt1max dt2max x2i y2i L1 L2 atstep
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
dt1max = 0.8;  % maximum speed inner pot
dt2max = 0.8;  % maximum speed outer pot

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
x2f  = input('Input the target X coordinate: ');
y2f = input('Input the target Y coordinate: ');

r_f = sqrt(x2f^2 + y2f^2);
theta_f = atan(y2f/x2f);


[t1old, t2old, x2i, y2i] = GetArmInfo();
theta1 = t1old * pi / 180;
theta2 = t2old * pi / 180;

[r_i,theta_i] = position(theta1,theta2)


[s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2)



% Record the points traversed
X(f) = x2i;
Y(f) = y2i;
ddt1=1;
ddt2=1;
while(dist >= 1.0)
	tic();
    [x2old, y2old,t1old,t2old] = twitch(s1*(1+s1dif),s2*(1+s2dif),time);
	time=toc();
	[t1new, t2new, x2new, y2new] = GetArmInfo();
	s1actual=(t1old-t1new)/time;
	s2actual=(t2old-t2new)/time;
	
	s1dif=(s1actual-s1)/s1actual;
	s2dif=(s2actual-s2)/s2actual;
	
	[t1old, t2old, x2i, y2i] = GetArmInfo();
	theta1 = t1old * pi / 180;
	theta2 = t2old * pi / 180;

	[r_i,theta_i] = position(theta1,theta2)


	[s1,s2] = speeds(r_i,r_f,theta_i,theta_f,L1,L2)


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