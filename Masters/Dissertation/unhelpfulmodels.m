%% Model trails - not useful 

figure()
[x,y]=meshgrid(-5:0.5:5);
z=cos(x)+sin(x);
contour(x,y,z,100)

figure()
[x,y]=meshgrid(-5:0.5:5);
z=cos(y)+(sin(y));
contour(x,y,z,100)


figure()
[x,y]=meshgrid(-5:0.5:5);
z=cos(y-2)+sin(y-2)+cos(x)+sin(y^2);
contour(x,y,z,100)

b0=4;
L=4;

figure()
[x,y]=meshgrid(-5:0.5:5);
z=(b0/2)*((tanh((x.*y)+L^0.5)-tanh((x.*y)-L^0.5)));
contour(x,y,z,100)

figure()
[x,y]=meshgrid(-5:0.5:5);
z=(x.^2)+(y.^2)+cosh(0.5*y);
contour(x,y,z,100);

figure()
[x,y]=meshgrid(-5:0.5:5);
z=(x.^2)+(L*y.^4);
contour(x,y,z,100);
