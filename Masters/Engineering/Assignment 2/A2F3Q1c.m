function [y] = A2F3Q1c(x)
%input x value (could be modified so input R)
%output trig function, y
R=10;
y=sqrt((R^2)-(x.^2))-x.*tan(x);
end

