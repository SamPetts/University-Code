function [y] = A3Q2F1(E,V,L)
%odd solutions of the form

m0=9.11e-31;
mb=0.069*m0;
mw=0.1*m0;
% mw=0.1;
hbar=1.0545718E-34;
% hbar=6.582119569e-16; %eV
c=mw/(2*hbar^2);
% (sqrt((0.69*(V-E)./E)))
% (sqrt((0.69*(V-E*1.6e-19)./E*1.6e-19)))+
y=(sqrt((0.69*(V-E)./E)))+cot(sqrt((c*(L^2).*E)));
end

