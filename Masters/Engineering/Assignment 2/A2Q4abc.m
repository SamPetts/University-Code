clear
format short g
f1='A2F8Q3a';

rootint1=Bracketing(f1,4,10,100,1e-10); 

x=linspace(4,10,100);
tol=1e-6;
imax=20;
f2='A2F9Q3a';

ry=0;
r1=newton(rootint1(1),f1,f2,imax,tol);
r2=Bisec(f1,x(rootint1(3)),x(rootint1(4)),imax,tol);
r3=Bisec(f1,x(rootint1(5)),x(rootint1(6)),imax,tol);
r4=Bisec(f1,x(rootint1(7)),x(rootint1(8)),imax,tol);

figure()
plot(x,(100.*exp(-x))-(5.*(sin((pi/2).*x))),'-',r1,ry,'o',r2,ry,'o',r3,ry,'o',r4,ry,'o'), xlabel('x axis'), ylabel('y axis');
title(['The Roots are X = ', num2str(r1), ', ' num2str(r2), ', ' num2str(r3), ', ' num2str(r4)]);
xlim([4 10]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off')

%%
figure();
x=linspace(3,10,50);
xval=[r1 r2 r3 r4]; 
yarray=zeros(1,length(xval)); 
for i=1:4
    yarray(:,i)=(5*sin((pi/2)*xval(i)));
end 

plot(x,(100.*exp(-x)),'-'), xlabel('x axis'), ylabel('y axis');
hold on 
plot(x,(5.*(sin((pi/2).*x))),r1,yarray(1),'o',r2,yarray(2),'o',r3,yarray(3),'o',r4,yarray(4),'o');
hold off
title(['Intercepts are (', num2str(r1) ', ', num2str(yarray(1)) '), (',num2str(r2) ', ', num2str(yarray(2)) ') and (', num2str(r3) ', ', num2str(yarray(3)) ')']);
% ylim([-5 5]);
xlim([4 10]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off');
