function int=trap1(f,a,b)
%Input - f is the integrand input as a string 'f'
% - a and b are upper and lower limits of integration
%Output - s is the trapezoidal rule sum, equation 3
if a>b
 error('b must be greater than a')
end
h=(b-a);
int=h*(feval(f,a)+feval(f,b))/2;
end