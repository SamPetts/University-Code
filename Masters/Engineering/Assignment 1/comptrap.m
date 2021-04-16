function compint=comptrap(f,a,b,n)
%Input - f is the integrand input as a string 'f'
% - a and b are upper and lower limits of integration, n is step value
%Output - Composite Trapezium Rule

if a>b
 error('b must be greater than a')
end

delx=(b-a)/n;
fi=0;
for i=1:n-1
    fi=fi+feval(f,a+delx*i);
end

sumf=2*fi;
    

compint=(delx*(feval(f,a)+sumf+feval(f,b)))/2;
end

