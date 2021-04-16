clear
format short g
N = 100;
x=linspace(-pi,pi,N)';

a=x(2)-x(1);
cos_array = zeros(N,1);


for ndx=1 %??
     cos_array(:,ndx)=FNumDiff(x,a(ndx));
end

figure()
plot(x,cos_array)
hold on
f=-sin(x);
plot(x,f), xlabel('x axis'), ylabel('y axis'), xlim([-pi pi])
set(gca, 'TickDir', 'out','box','off')
hline=refline(0,0);
hline.LineStyle = ':';
title('The analytical and numerical derivative of the cosine function');
legend('Numerical method', 'Analytical method')
lgd=legend;
lgd.FontSize=15;
hold off

yy=cos(x);
figure()
plot(x,yy), xlabel('x axis'), ylabel('y axis'), xlim([-pi pi]), ylim([-1 1])
title(['The cosine function']);
set(gca, 'TickDir', 'out','box','off')
hline=refline(0,0);
hline.LineStyle = ':';