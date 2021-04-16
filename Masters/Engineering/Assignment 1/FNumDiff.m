function [y] = FNumDiff(x,a)
%input x val and step value, a
%Numerical differentiation of cos(x)
y= (cos(x+a)-cos(x))/a;
end

