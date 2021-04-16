clear 
close all
format long g

tol = 1E-6;
imax = 20;
x1=5;
x2=1;
ry=0;
f1='A2F4Q2b';
f2='A2F5Q2b';
f3='A2F6Q2c';
f4='A2F7Q2c';
r1=newton(x1,f1,f2,imax,tol);
r2=newton(x2,f3,f4,imax,tol);



figure(1)
subplot(1,2,1)
x=linspace(-5,5,50);
plot(x,exp(x)-(1+x+((x.^2)/2)),'-',r1,ry,'o'), xlabel('x axis'), ylabel('y axis');
ylim([-5 16]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off');
title(['Root is X = ', num2str(r1)]);

figure(1);
subplot(1,2,2);
x=linspace(0,6,50);
plot(x,10*log(x)-x,'-',r2,ry,'o'), xlabel('x axis'), ylabel('y axis');
ylim([-5 16]);
hline=refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off');
title(['Root is X = ', num2str(r2)]);

sgtitle('Newton Method');


