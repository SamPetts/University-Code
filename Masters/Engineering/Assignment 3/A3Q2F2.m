function [y] = A3Q2F2(E,V,L)
%even solutions of the form
m0=9.109384E-31;
mw=0.1*m0;
hbar=1.0545718E-34;
c=mw/(2*hbar^2);
% (sqrt((0.69*(V-E*1.6e-19)./E*1.6e-19)))-
y=(sqrt((0.69*(V-E)./E)))-tan(sqrt((c*(L^2).*E)));
end

