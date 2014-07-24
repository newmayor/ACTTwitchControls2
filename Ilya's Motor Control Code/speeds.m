
function [derv1,derv2]=speeds(r_i,r_f,theta_i, theta_f)  
%theta_i and theta_f given in radians r_i and r_f given in inches. function
%produces and evaluates derivatives of theta1 and theta2  in terms of
%theta_i. output is in rad per theta tot.

global dt1 dt2

L1 = 9;     %inches
L2 =14.75;
            
syms t;

x_i=r_i*cos(theta_i);
y_i=r_i*sin(theta_i);   %coordinates in cartesian
x_f=r_f*cos(theta_f);
y_f=r_f*sin(theta_f);

dy=y_f-y_i;
dx=x_f-x_i;          %changes in x and y

m=dy/dx;             %slope of path

c=r_i*sin(theta_i)-m*r_i*cos(theta_i); %y-int of path

theta1(t)=pi - t- asin(L2 * sin( acos(( -((c)/(sin(t)-((m)*cos(t))))^2 ...
    +L1^2+L2^2)/(2*L1*L2)))/((c)/(sin(t)-(m)*cos(t))));

theta2(t)=acos(((c)/(sin(t)-(m)*cos(t))^2+L1^2+L2^2)/(2*L1*L2));

d1=diff(theta1); %derivative of theta1
d2=diff(theta2); %derivative for theta2


derv1=eval(subs(d1,t,theta_i)); %evaluates derivative for theta1 
derv2=eval(subs(d2,t,theta_i)); %evaluates derivative for theta2 

dt1=derv1;
dt2=derv2;
end
