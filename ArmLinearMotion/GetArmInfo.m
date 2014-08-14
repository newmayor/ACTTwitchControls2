function [t1,t2,x2,y2,x1,y1,r,theta] = GetArmInfo()  
% This function returns the angles and cartesian coordinates of the tip
% location

    global a MOTOR1 MOTOR2 MOTORMAX PIN_motor1_en PIN_motor1_pwm1...
    PIN_motor1_pwm2 PIN_motor2_en PIN_motor2_pwm1 PIN_motor2_pwm2...
    PIN_pot0 PIN_pot1 Pot0_Center Pot1_Center Pot0_RLimit Pot0_LLimit...
    Pot1_RLimit Pot1_LLimit
global  L1 L2 

t1min = 290;
t1max = 1020;
t2min = 180;
t2max = 890;

    % output angles in radians
    t1=((a.analogRead(PIN_pot0)-t1min)/(t1max-t1min)*180-90)*pi/180;
    t2=((a.analogRead(PIN_pot1)-t2min)/(t2max-t2min)*180-90)*pi/180;
    
    x1 = L1*sin(t1);
    y1 = L1*cos(t1);

    x2 = x1 + L2*sin(t1+t2);
    y2 = y1 + L2*cos(t1+t2);
    lx = [0,x1,x2];
    ly = [0,y1,y2];
    
    r = sqrt(x2*x2+y2*y2);%(L1^2 + L2^2 + 2 * L1 * L2 * cos(t2))^(1/2);
    theta=t1+.5*pi-acos((L1*L1+r*r-L2*L2)/(2*L1*r));
    
    plot(x1,y1,'O',x2,y2,'O',0,0,'O',lx,ly);
    axis([-24 24 -24 24]);
    axis('square');
    set(gcf,'color','w');
    grid on;
