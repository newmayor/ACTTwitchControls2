function [t1,t2,x2,y2,x1,y1] = GetArmInfo()  
% This function returns the angles and cartesian coordinates of the tip

global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1 PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2 PIN_pot1 PIN_pot2
global  L1 L2 

t1min = 260;
t1max = 990;
t2min = 180;
t2max = 890;

    % output angles in radians
    t1=((a.analogRead(PIN_pot1)-t1min)/(t1max-t1min)*180)*pi/180;
    t2=((a.analogRead(PIN_pot2)-t2min)/(t2max-t2min)*180)*pi/180;
    L1 = 9.0;   % Length of base arm (inches)
    L2 = 14.75;  % length of outer arm (inches)
    x1 = L1*sin(t1);
    y1 = L1*cos(t1);

    x2 = x1 + L2*sin(t1+t2);
    y2 = y1 + L2*cos(t1+t2);
    lx = [0,x1,x2];
    ly = [0,y1,y2];
    
    plot(x1,y1,'O',x2,y2,'O',0,0,'O',lx,ly);
    axis([-24 24 -24 24]);
    axis('square');
    set(gcf,'color','w');
    grid on;
