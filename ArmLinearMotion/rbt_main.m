%% ilya anishchenko

clear all;
clc
delete(instrfind({'Port'},{'COM19'}));
global er dt1max dt2max time x2i y2i x2f y2f L1 L2 t1 t2 dt1 dt2 atstep
%the variables are global so that the function has acess to them
global a MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot0 PIN_pot1

%% Arm Control Code
% Set by the call to arm_bebe
t1 = 0;  % dummy initialiazation (this will be overwritten later)
t2 = 0;  % dummy initialiazation (this will be overwritten later)
% Arm info 
L1 = 9.0;   % Length of base arm (inches)
L2 = 14.75;  % length of outer arm (inches)

% Read in initial positions
x2i  = -5;  % initial position of potentiometer #1 (in degrees/(180/pi))
y2i = 20;   % initial position of potentiometer #2 (in degrees/(180/pi))

% Set the final desired positions
x2f  = 12; % final position of potentiometer #1 (in degrees/(180/pi))
y2f = 1;   % final position of potentiometer #2 (in degrees/(180/pi))


time = 0;  % global time counter (counts the length of simulation) in milliseconds!

dt1max = 0.9;  % maximum speed (rad/sec) of the inner pot
dt2max = 0.9;  % maximum speed (rad/sec) of the outer pot
er = 0;        % error check, if == 1 then there is something wrong
f = 1;   %counter and index for the number of times arm_bebe function was acessed

k = 0;   %dont worry about this variable, not important to our goal

atstep = .1; 
adstep = .1;

x2old = x2i;
y2old = y2i;

    % Current radius and angle
    r = sqrt(x2old^2 + y2old^2); 
    theta = acos(x2old/r);    

    % angle of the outer pot
    t2old = pi - acos((r^2 - L1^2 - L2^2)/(-2*L1*L2));

    tin = acos((L2^2 - r^2 - L1^2)/(-2*L1*r));
    % angle of the inner pot
    t1old = (pi/2 - theta) - tin;
    
% distance from current position to final position
dist = sqrt((y2f - y2i)^2 + (x2f - x2i)^2);


ty = (y2f - y2i)/dist;
tx = (x2f - x2i)/dist;

y2new = adstep*(ty)+y2old;
x2new = adstep*(tx)+x2old;
    r = sqrt(x2new^2 + y2new^2);
    theta = acos(x2new/r);    
    t2new = pi - acos((r^2 - L1^2 - L2^2)/(-2*L1*L2));
    tin = acos((L2^2 - r^2 - L1^2)/(-2*L1*r));
    t1new = (pi/2 - theta) - tin;

dt1 = t1new - t1old;
dt2 = t2new - t2old;

% Record the points traversed
X(f) = x2old;
Y(f) = y2old;
while(dist >= 1.0)
    [x2old, y2old,tt1,tt2] = arm_bebe(dt1,dt2);
    f = f+1;
    X(f) = x2old;
    Y(f) = y2old;
        
        % current pos information
        % comment this out and use tt1 and tt2 instead of t1old and t2old
%         r = sqrt(x2old^2 + y2old^2);
%         theta = acos(x2old/r);
%         t2old = pi - acos((r^2 - L1^2 - L2^2)/(-2*L1*L2));
%         tin = acos((L2^2 - r^2 - L1^2)/(-2*L1*r));
%         t1old = (pi/2 - theta) - tin;
%         dist = sqrt((y2f - y2old)^2 + (x2f - x2old)^2);
        t1old=tt1;
        t2old=tt2;
        
    y2new = (adstep*f)*(ty)+y2i;
    x2new = (adstep*f)*(tx)+x2i;
        
        r = sqrt(x2new^2 + y2new^2);
        theta = acos(x2new/r);
        t2new = pi - acos((r^2 - L1^2 - L2^2)/(-2*L1*L2));
        tin = acos((L2^2 - r^2 - L1^2)/(-2*L1*r));
        t1new = (pi/2 - theta) - tin;    
            
    dt1 = t1new - t1old;    %velocity of motors
    dt2 = t2new - t2old;  
   % fprintf('tt1: %2.2f  tt2: %2.2f\n',tt1,tt2);
    fprintf('dt1: %2.2f  dt2: %2.2f\n',dt1,dt2);
end

hold on;
plot(X,Y);  %plots the path taken by the outer arm
axis([-24 24 -24 24]);
axis('square');
set(gcf,'color','w');
grid on;
    

