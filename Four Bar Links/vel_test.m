r = round(10 * (0.5 + (1 - 0.5).*rand(25,1))) * 0.1;

for i = 1:25
    vel(i,:) = vel_profile(r(i));
    disp(vel); 
end