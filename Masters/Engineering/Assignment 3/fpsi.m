function [y] = fpsi(n,a,x)
%input - n=Energy Level, a=Well Width
%output - wavefunction
%for even functions use sin, for odd use cos

if mod(n,2)==0
    y=(sin((n.*x*pi)/(2*a)))/sqrt(a);
else 
    y=(cos((n.*x*pi)/(2*a)))/sqrt(a);
end

