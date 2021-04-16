clear 
format long g

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part b & c%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(2, '\n %%%%%%%% Part b & c %%%%%%%% \n \n');

n=[5,50,100];
b=2;
a=1;
f ='f2';
x=zeros(1,length(n));

for i=1:length(n)
x(:,i)=A1F1Q3a(f,a,b,n(i));
end

diff1=x(1)-log(2);
diff2=x(2)-log(2);
diff3=x(3)-log(2);
x1=x(1);
x2=x(2);
x3=x(3);
A=[5 x1 log(2) diff1; 50 x2 log(2) diff2; 100 x3 log(2) diff3]; %Table setup
T = array2table(A,'VariableNames',{'Value of n', 'Numerical Value', 'Analytical Value', 'Difference in integral values'});
title = 'Simpsons Rule';

fprintf('%52s\n',title) % allocate 52 character spaces for the title.
fprintf(1, '\n');
disp(T)


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part d %%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(2, '\n %%%%%%%% Part d %%%%%%%% \n \n');

i=1; %step value
x=A1F1Q3a(f,a,b,i);
PerE=abs(((x/log(2))-1)*100); %Percent error

while PerE>1e-6
   i=i+1; %sub int
   x=A1F1Q3a(f,a,b,i);
   PerE=abs(((x/log(2))-1)*100);
end
i;
X=['The number of sub-intervals needed to achieve an accuracy of at least 6 decimal places is ', num2str(i) ' when using the Simpson’s Rule.'];
disp(X)