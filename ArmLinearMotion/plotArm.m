function plotArm()
	[t1, t2, x2, y2 ,x1, y1] = GetArmInfo();
	lx = [0,x1,x2];
    ly = [0,y1,y2];
    plot(x1,y1,'O',x2,y2,'O',0,0,'O',lx,ly);
    axis([-24 24 -24 24]);
    axis('square');
    set(gcf,'color','w');
    grid on;