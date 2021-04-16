function [y] = En(n,a)
%input - energy level and well width
%

m=9.1E-31;
hbar=1.05E-34;
y=((n.^2).*(pi^2)*(hbar^2))/(8*m.*(a.^2)*1.6e-19);
end

