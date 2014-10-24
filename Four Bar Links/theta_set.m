%Parameters:an n by 2 matrix of ones and zeros that represent whether an
%angle is in or out of bounds. The first column represents the first path
%angle options and the second column holds the angle options for the second
%possible orientation.
%Results: a matrix with the value 1 if the theta set orientation is vaiable
%and 0 if it isn't. Where the first column represents the first theta set &
%the second column represets the second theta set.
%Description:function checks to see which orientations are viable if any.

function [theta1,theta2] = theta_set(thetas)
if thetas(:,1) == 1;
    theta1 = 1;
elseif thetas(:,1) == 0
     theta1 = 0;   
elseif thetas(:,1)~= 1 || thetas(:,1)~= 0
        error('theta_set:Orientation','Orientation Array Error');
end
 
if thetas(:,2) == 1;
    theta2 = 1; 
elseif thetas(:,2) == 0
     theta1 = 0;   
elseif thetas(:,2)~= 1 || thetas(:,2)~= 0
        error('theta_set:Orientation','Orientation Array Error');
end
end

    