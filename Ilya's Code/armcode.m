% given: absolute first theta_i and r_i, theta_f, and theta_f
%theta_i=
%theta_f=
%r_i=
%r_f=

[s1,s2]=speeds(r_i,r_f,theta_i, theta_f);   %initital caculation of how theta1 
                                            %and theta2 change with
                                            %theta_tot

%max_speed1=
%max_speed2=        measured in rad/sec

ratio1=maxspeed_1/s1;
ratio2=maxspeed_2/s2;    %finds d(theta)/dt

   if ratio1>ratio2;
       
       d01_dt=s1*ratio2;   %finds the speeds of theta1 and theta2 when motor 2 is limiting
       d02_dt=s2*ratio2; 
    
   else ratio2>ratio1;
        
       d01_dt=s1*ratio1;   %%finds the speeds of theta1 and theta2 when motor 1 is limiting
       d02_dt=s2*ratio1;
   end
%sends to motor

%set delay for .1 sec before starting loop so arm can move

while theta_1 ~= theta_2
    %read theta1 and theta2 (in radians) from pot to see new positions
    %theta1=
    %theta2=
    
    [r_i,theta_i] = position(theta1,theta2);     %calculates new r_i and theta_i 
    
    [s1,s2]=speeds(r_i,r_f,theta_i, theta_f);   %finds new speeds
    
  %calculations of new speeds

   ratio1=maxspeed_1/s1;
   ratio2=maxspeed_2/s2;    %finds d(theta)/dt

    if ratio1>ration2;
        
        d01_dt=s1*ratio2;   %finds the speeds of theta1 and theta2 when motor 2 is limiting
        d02_dt=s2*ratio2; 
    
    else ratio2>ratio1;
        
        d01_dt=s1*ratio1;   %%finds the speeds of theta1 and theta2 when motor 1 is limiting
        d02_dt=s2*ratio1;
    end
    
 %read theta1 and theta2 (in radians) from pot to see new positions
 %theta1=
 %theta2=
[r_i,theta_i] = position(theta1,theta2);     %calculates new r_i and theta_i
  
%set delay for .1 sec so loop can repeat  
end

