clear 
format long g

tol = 1E-10;
imax = 1000;
x=4;
ry=0;
f1='A2F8Q3a';
df='A2F9Q3a';
r1=newton(x,f1,df,imax,tol);
y=1.5085;


figure();
subplot(1,2,1);
x=linspace(3,10,50);
plot(x,(100.*exp(-x)),'-'), xlabel('x axis'), ylabel('y axis');
hold on 
plot(x,(5.*(sin((pi/2).*x))),r1,y,'o');
hold off
title(['Intercept is (', num2str(r1) ' ,', num2str(y) ')' ]);
ylim([-5 5]);
xlim([3 10]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off');

subplot(1,2,2);
plot(x,(100.*exp(-x))-(5.*(sin((pi/2).*x))),r1,ry,'o') , xlabel('x axis'), ylabel('y axis');
title(['Root is X = ', num2str(r1)]);
ylim([-5 5]);
xlim([3 10]); 
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off');

sgtitle('Newton Method - Intersection of two functions')





