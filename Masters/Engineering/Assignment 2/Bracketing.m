function [rootint1] = Bracketing(f,int1,int2,spacing,tol)
% Input: f - function to be evaluated
% int1,int2 - interval limits
% spacing - number of spacing between intervals 
% tol - convergence criterion
% Output: interval of possible roots

%looks for change in sign of y value for an area of a possible root




array=zeros(1,spacing);
k=numel(array);
x=linspace(int1,int2,k);
j=1;


for i=1:k
    array(:,i)=feval(f,x(j));
    j=j+1;
end

a=array./tol;
a1=1;
a2=a1+1;
b=a(a1)*a(a2);
i=1;
rootint=[];

while i<=k && a2 <=k
    b=a(a1)*a(a2);
    if b>0
        a1=a2;
        a2=a2+1;
    else
        rootint(:,:,i)=[a1,a2];
        a1=a2;
        a2=a2+1;
    end
    rootint1=squeeze(rootint);
    rootint1(rootint1==0)=[];
    
    i=i+1;   
end

end

