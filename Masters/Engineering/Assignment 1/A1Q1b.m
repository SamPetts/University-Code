b=pi/2;
a=0;
I ='A1Q1a';
x=trap1(I,a,b);

y=(sin(pi/2)-(pi/2)*cos(pi/2))-sin(0);

diff=x-y;
A=[x y diff];
T = array2table(A,'VariableNames',{'Numerical Value', 'Analytical Value', 'Difference in values'});
title = 'Trapezium Rule';
fprintf('%38s\n',title) % allocate 38 character spaces for the title.
fprintf(1, '\n'); %New line
disp(T)
fprintf(1, '\n'); %New line

perc=((x-y)/y)*100;
X=['The numerical method gives an answer ', num2str(perc), ' percent bigger than the analytical.'];
disp(X)