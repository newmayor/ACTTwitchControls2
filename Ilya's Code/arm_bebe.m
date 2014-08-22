%ilya anishchenko
function [ x2, y2, tt1, tt2 ] = arm_bebe( dt1, dt2 )
%simulates the robot arm ACT has built
%this function returns the x and y coordinate of where the arm is pointing
%to, tt1 and tt2 are just t1 and t2 (will be used with the real arm so for
%now ignore them)

%%% dt1 is the speed of theta 1 in rad/sec
%%% dt2 is the speed of theta 2 in rad/sec

%%%% t1 is theta 1
%%%% t2 is theta 2

%%% the following sets the limits of t1 and t2 in radians
t1max = 180/57.3;
t1min = 0/57.3;
t2max = 240/57.3;
t2min = 30/57.3;


global er dt1max dt2max time t1i t2i L1 L2 t1 t2   
if(time == 0)       
%initializes the arm position at the start of the simulation
    t1 = t1i;
    t2 = t2i;
end

if(abs(dt1max) < abs(dt1))    
%checks to make sure speed limit is not exceeded
    if(dt1 < 0)
        dt1 = -dt1max;
    else
        dt1 = dt1max;
    end
end

if(abs(dt2max) < abs(dt2))    
%checks to make sure speed limit is not exceeded
    if(dt2 < 0)
        dt2 = -dt2max;
    else
        dt2 = dt2max;
    end
end

%4 if statements to make sure that the motor arm positions are within range
%modify the limits to 
if((t1 < t1min) && (dt1 < 0))
    er = 1;
elseif((t1 > t1max) && (dt1 > 0))
    er = 1;
elseif((t2 > t2max) && (dt2 > 0))
    er = 1;
elseif((t2 < t2min) && (dt2 < 0))
    er = 1;
end

if(er < 1)
    
    t1 = t1 + dt1*0.03;
    t2 = t2 + dt2*0.03;
    x1 = -L1*cos(t1);
    y1 = L1*sin(t1);
    
    if(t2 < pi)
        r = sqrt(L1^2 + L2^2 - 2*L1*L2*cos(t2));
        tt = pi - (t1 + (pi - ((asin(L1*sin(t2)/r))+t2)));
    else
        r = sqrt(L1^2 + L2^2 - 2*L1*L2*cos((2*pi) - t2));
        tt = pi - t1 - (pi - ((asin(L1*sin(t2)/r))+t2));
    end
    x2 = r*cos(tt);
    y2 = r*sin(tt);
    lx = [0,x1,x2];
    ly = [0,y1,y2];
    
    plot(x1,y1,'O',x2,y2,'O',0,0,'O',lx,ly);
    axis([-24 24 -24 24]);
    axis('square');
    set(gcf,'color','w');
    grid on;
else
    
end

tt1 = t1; %this will be used when the actual arm is working (ignore for now)
tt2 = t2;  %this will be used when the actual arm is working (ignore for now)

time = time + 20;
pause(0.001);  %this pause enables animation to happen

end

