%ilya anishchenko
clear all;
global er dt1max dt2max time t1i t2i L1 L2 t1 t2 dt1 dt2
%the variables are global so that the function has acess to them

t1 = 0;  %dummy initialiazation (this will be overwritten later)
t2 = 0;  %dummy initialiazation (this will be overwritten later)
L1 = 9.0;   %Length of base arm (inches)
L2 = 14.75;  %length of outer arm (inches)
t1i  = 1/57.3;    %initial position of potentiometer #1 (in degrees/(180/pi))
t2i = 230/57.3;   %initial position of potentiometer #2 (in degrees/(180/pi))
time = 0;  %global time counter (counts the length of simulation) in milliseconds!

dt1max = 0.3;  %maximum speed (rad/sec) of the inner pot
dt2max = 2.6;  %maximum speed (rad/sec) of the inner pot
er = 0;       %error check, if == 1 then there is something wrong
f = 1;   %counter and index for the number of times arm_bebe function was acessed

k = 0;   %dont worry about this variable, not important to our goal

%a=arduino(input('comport'))

while(time < 60000)

    %{
       t1=a.analogRead(0);      reading in from pot
       t2=a.analogRead(1);
  %}  
    
    if(t1 < 130/57.3)
        dt1 = 0.03;
    else
        dt1 = 0;
    end
    if((t2 > 32/57.3) && (k == 0))
        k = 0;
        dt2 = -2.5;
    else
        k = 1;
    end
    if((k == 1) && (t2 < 230/57.3))
        k = 1;
        dt2 = 2.5;
    else
        k = 0;
    end
    
    [x2, y2] = arm_bebe(dt1,dt2);
    X(f) = x2;
    Y(f) = y2;
    f = f+1;
end

plot(X,Y);  %plots the path taken by the outer arm
axis([-24 24 -24 24]);
axis('square');
set(gcf,'color','w');
grid on;
    

