f1='A2F2Q1b';
f2='A2F3Q1c';
intv1=[1 4];
intv2=[4 4.7];
imax=50;
tol=1e-6;

r1=Bisec1(f1,intv1(1),intv1(2),imax,tol);
r2=Bisec1(f2,intv2(1),intv2(2),imax,tol);
ry=0;



figure(1)
subplot(1,2,1);
x=linspace(1,4,50);
plot(x,sin(x).*sinh(x),'-',r1,ry,'o'), xlabel('x axis'), ylabel('y axis');
ylim([-25 5]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off');
title(['Root is X = ', num2str(r1)]);

figure(1)
subplot(1,2,2);
x=linspace(4,4.7,50);
plot(x,sqrt((10^2)-(x.^2))-x.*tan(x),'-',r2,ry,'o'), xlabel('x axis'), ylabel('y axis');
ylim([-25 5]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off');

title(['Root is X = ', num2str(r2)]);

sgtitle('Bisection Method');

