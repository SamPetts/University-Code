function root = newton(x,f,df,imax,tol)
% Input: x initial guess at the root
% f function to be evaluated
% df derivative of f with respect to x
% imax iteration maximum
% tol convergence criterion
% Output: root position of the root
%
% Newton's algorithm

% initialise parameters, i.e.

xold=x;
fold=feval(f,xold);
dfold=feval(df,xold);
dx=-fold/dfold;
xnew=xold + dx;
fnew=feval(f,xnew);

count=0;

while (norm(fnew)>tol && count<imax)
 if df == 0
    error('Problem')
 end
 xold=xnew;
 fold=feval(f,xold);
 dfold=feval(df,xold);
 dx=-fold/dfold;
 xnew=xold + dx;
 fnew=feval(f,xnew);
 count=count+1;
 
 fprintf('Iteration - %i,\t Error - %g\n',count,norm(fnew))

end
root=xnew
