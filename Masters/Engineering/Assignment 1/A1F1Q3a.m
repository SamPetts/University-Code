function Simps=A1F1Q3a(f,a,b,n)
%Input - f is the integrand input as a string 'f'
% - a and b are upper and lower limits of integration, n is step value
%Output - Simpsons Rule

if a>b
 error('b must be greater than a')
end

delx=(b-a)/n;

fieven=0;
for i=2:2:n-1;
    fieven=fieven+feval(f,a+delx*i);
end
sumfeven=2*fieven;

fiodd=0;
for i=1:2:n-1;
    fiodd=fiodd+feval(f,a+delx*i);
end
sumfodd=4*fiodd;

Simps=(delx*(feval(f,a)+sumfeven+sumfodd+feval(f,b)))/3;
end

