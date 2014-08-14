function MainHelper


    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit


%% Reset to default position
disp('Setting arm to the default position')
% CenterArm()


%% Prompt User for Final Cartesian Position
x2f  = input('Input the target X coordinate: ');
y2f = input('Input the target Y coordinate: ');


%% Calculate Polar Position
% 0 rad is the positive x axis
r_f = sqrt(x2f^2 + y2f^2);
theta_f = atan(y2f/x2f);

%% Caculate Current Position
% 0 rad is the positive x axis
[t1old, t2old, x2i, y2i,xt,yt,r_i,theta_i] = GetArmInfo();
theta1 = t1old;% * pi / 180;
theta2 = t2old;% * pi / 180;


%% Determine speeds that the motors need to operate at
[s1,s2] = speeds(r_i,r_f,theta_i,theta_f);%,x2i,y2i,x2f,y2f);

s1=angle(s1)
s2=angle(s2)

f= 1;
% Record the points traversed
X(f) = x2i;
Y(f) = y2i;
ddt1=1;
ddt2=1;
tic();
plotArm();
distance=999999999;
s1dif=s1;
s2dif=s2;
spdarr1(1)=s1;
spdarr2(1)=s2;
[t1new, t2new, x2new, y2new] = GetArmInfo();

while(distance  >= 1.0)
    %% Calculate Error
	
	
	s1dif=s1;%+(s1actual-s1)*P_CONST;%/s1actual;
	s2dif=s2;%+(s2actual-s2)*P_CONST;%/s2actual;
	
	theta1 = t1new * pi / 180;
	theta2 = t2new * pi / 180;

	[r_i,theta_i] = position(theta1,theta2);

	% Determine speeds that the motors need to operate at
	[s1,s2] = speeds(r_i,r_f,theta_i,theta_f);
    s1=angle(s1)/10
    s2=angle(s2)/10
    
    [x2old, y2old,t1old,t2old] = twitch(s1dif,s2dif);
	[t1new, t2new, x2new, y2new] = GetArmInfo();
	
	X(f) = x2old;
	Y(f) = y2old;
	f=f+1
    
% 	% Actual speeds of the motors
% 	s1actual=(t1old-t1new)/time;
% 	s2actual=(t2old-t2new)/time;
% 
    
    spdarr1(f)=s1;
    spdarr2(f)=s2;
	
	distance = sqrt((y2f - y2old)^2 + (x2f - x2old)^2)
	
	plotArm();
    pause(.01)
    DriveMotor(MOTOR1,0);
    DriveMotor(MOTOR2,0);
    input('enter something to continue');

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