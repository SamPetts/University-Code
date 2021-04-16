function BiSec = Bisec(f,a,b,imax,tol)
% Input: f function to be evaluated
% a,b interval limits
% imax iteration maximum
% tol convergence criterion
% Output: root position of the root
% initialise parameters, i.e.

x1=a;
f1=feval(f,x1);
x3=b;
f3=feval(f,x3);
d=(x1+x3)/2;
f2=feval(f,d);

% CHECK: verify that there is indeed a root in the interval [a b].
if f1*f3>0
    error('No root in the specified interval')
end

for ii = 1:imax
    x2=(x3+x1)/2;
    f2=feval(f,x2);
    if f1*f2<0
        % Root is in left half, so
        d=(x2+x1)/2;
        f3=f2;
        x3=x2;
    else
        % Root is in right half, so
        d=(x2+x3)/2;
        f1=f2;
        x1=x2;
    end
    if abs(d-x2)<tol
        break
    end
    
end
BiSec=x2



