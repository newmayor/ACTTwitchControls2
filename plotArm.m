Parameters: the cartesian coordinates of the arm 
Return: a graph of the arm 
Description: Plots the arm 
function plotArm(X_tip,Y_tip)

hold on;
plot(X_tip,Y_tip);
axis([-24 24 -24 24]);
axis('square');
set(gcf,'color','w');
grid on;