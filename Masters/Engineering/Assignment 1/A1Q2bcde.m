clear 
format long g

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part b %%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(2, '\n %%%%%%%% Part b %%%%%%%% \n \n');

b=pi/2;
a=0;
I ='I';
n1=100;

x1=comptrap(I,a,b,n1); %Composite Trapezium Rule
y1=(sin(pi/2)-(pi/2)*cos(pi/2))-sin(0);

diff=x1-y1;
A=[x1 y1 diff];
T = array2table(A,'VariableNames',{'Numerical Value', 'Analytical Value', 'Difference in values'}); % Table comparing values
title = 'Composite Trapezium Rule';
fprintf('%45s\n',title) % allocate 45 character spaces for the title.
fprintf(1, '\n'); %New line
disp(T)
fprintf(1, '\n'); %New line

perc=((x1-y1)/y1)*100; %Percent error

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part cd %%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(2, '\n %%%%%%%% Part c & d %%%%%%%% \n \n');

n=[5,50,100];
b=2;
a=1;
f ='f2';
x=zeros(1,length(n));


for i=1:length(n)
x(:,i)=comptrap(f,a,b,n(i));
end

diff1=x(1)-log(2);
diff2=x(2)-log(2);
diff3=x(3)-log(2);
x1=x(1);
x2=x(2);
x3=x(3);
A=[5 x1 log(2) diff1; 50 x2 log(2) diff2; 100 x3 log(2) diff3];
T = array2table(A,'VariableNames',{'Value of n', 'Numerical Value', 'Analytical Value', 'Difference in integral values'});
title = '                       Composite Trapezium Rule';

fprintf('%58s\n',title) % allocate 58 character spaces for the title.
fprintf(1, '\n');
disp(T)
% fprintf(1, '\n');
% fprintf(1, '\n');
% X=['The different between the numerical and analytical value is ' num2str(diff)];
% disp(X)

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part e %%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
fprintf(2, '\n %%%%%%%% Part e %%%%%%%% \n \n');

x=comptrap(f,a,b,i);
PerE=((x/log(2))-1)*100;

while PerE>1e-6 %Whilo loop works out number of intevals to achieve accuracy of 6 dp
   i=i+1; %sub int
   x=comptrap(f,a,b,i);
   PerE=((x/log(2))-1)*100;
end
i;
Y=['The number of sub-intervals needed to achieve an accuracy of at least 6 decimal places is ', num2str(i)]; 
disp(Y)

TimeTaken=toc