function plotArm(X_tip,Y_tip)

hold on;
plot(X_tip,Y_tip);
axis([-24 24 -24 24]);
axis('square');
set(gcf,'color','w');
grid on;