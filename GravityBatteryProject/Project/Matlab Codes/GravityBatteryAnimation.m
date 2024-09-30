clear 
clc 
n=6;
r=1;
e=0;
c=input('How many times do you want to repeat the animations: ');
while e<c
theta = linspace(0,n*2*pi,50);
alpha = linspace(0,r*2*pi,50);
pos = [-10, -10.25, -10.5, -10.75, -11, -11.25, -11.5, -11.75, -12, -12.25, -12.50, -12.75, -13.00, -13.25, -13.50, -13.75, -14.00, -14.25, -14.50, -14.75, -15.00, -15.25, -15.50, -15.75, -16.00, -16.25, -16.50, -16.75, -17.00, -17.25, -17.50, -17.75, -18.00, -18.25, -18.50, -18.75, -19.00, -19.25, -19.50, -19.75, -20.00, -20.25, -20.50, -20.75, -21.00, -21.25, -21.50, -21.75, -22.00, -22.25, -22.50, -22.75];
slider_x=[-23 -21 -21 -23 -23];
AB=2; 
CD=7;
Lx = 7*cos(theta);
Ly = 7*sin(theta);
Bx = AB*cos(theta);
By = AB*sin(theta);
Rx = -20 + AB*cos(theta);
Ry = AB*sin(theta);
Dx = -20 + CD*cos(alpha);
Dy = CD*sin(alpha);
Dix = -20 + CD*cos(theta);
Diy = CD*sin(theta);
pause(1);
for i = [1:50]
plot(Bx,By,'-',0,0,'ko');
hold on
plot([-20,0],[7,2],'r');
plot([-20,0],[-7,-2],'r');
plot(Lx,Ly);
plot(Dix,Diy,'-',-20,0,'ko');
plot(Rx,Ry,'-');
plot([-22,-22],[0,pos(i)],'r');
slider_y=[pos(i)-1 pos(i)-1 pos(i)+1 pos(i)+1 pos(i)-1];
plot([-18,-18],[0,-30],'r');
plot([0,Bx(i)],[0,By(i)],'k','linewidth',2);
plot([-20,Dx(i)],[0,Dy(i)],'k','linewidth',2);
fill(slider_x,slider_y,'b')
drawnow;
hold off
end
pause(1);
theta = linspace(0,n*2*pi,50);
alpha = linspace(0,r*2*pi,50);
pos = [-22.75, -22.50, -22.25, -22.00, -21.75, -21.50, -21.25, -21.00, -20.75, -20.50, -20.25, -20.00, -19.75, -19.50, -19.25, -19.00, -18.75, -18.50, -18.25, -18.00, -17.75, -17.50, -17.25, -17.00, -16.75, -16.50, -16.25, -16.00, -15.75, -15.50, -15.25, -15.00, -14.75, -14.50, -14.25, -14.00, -13.75, -13.50, -13.25, -13.00, -12.75, -12.50, -12.25, -12.00, -11.75, -11.50, -11.25, -11.00, -10.75, -10.50, -10.25, -10.00];
Bx = AB*cos(-1*theta);
By = AB*sin(-1*theta);
Dx = -20 + CD*cos(-1*alpha);
Dy = CD*sin(-1*alpha);
for j = [1:50]
plot(Bx,By,'-',0,0,'ko');
hold on
plot([-20,0],[7,2],'r');
plot([-20,0],[-7,-2],'r');
plot(Lx,Ly);
plot(Dix,Diy,'-',-20,0,'ko');
plot(Rx,Ry,'-');
plot([-22,-22],[0,pos(j)],'r');
slider_y=[pos(j)-1 pos(j)-1 pos(j)+1 pos(j)+1 pos(j)-1];
plot([-18,-18],[0,-30],'r');
plot([0,Bx(j)],[0,By(j)],'k','linewidth',2);
plot([-20,Dx(j)],[0,Dy(j)],'k','linewidth',2);
fill(slider_x,slider_y,'b')
drawnow;
hold off
end
e=e+1;
end