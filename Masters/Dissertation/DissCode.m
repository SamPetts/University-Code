%% 1D model of magnetic field 
b0=4;
L=4;
x=linspace(-5,5,1000);
R=0.2;

y2=zeros(1,length(x));
for i=1:length(x)
    y2(i)=(b0/2)*(((x(i)+(L/2))/((R^2)+(x(i)+L/2)^2)^0.5)-(x(i)-L/2)/((R^2)+(x(i)-L/2)^2)^0.5);
end
dy2=zeros(1,length(x));
for i=1:length(x)
dy2(i)=(4*b0*R^2).*(-(L^2-4*L.*x(i)+4*(R^2+x(i).^2)).^(-3/2) + (L^2+4*L.*x(i)+4*(R^2 + x(i).^2)).^(-3/2));
end 

figure()
plot(x,y2,'k');
ylim([0,10]);
ylabel('B_{0} (T)')
hold on 
yyaxis right
ylabel('dB_{0}/dx (T/m)')
plot(x,abs(dy2))
xline(0,'-')
xline(2,':')
xline(-2,':')
hold off
title('Magnetic field variation in the z-plane of an MRI coil');
xlabel('z (m)')
legend({'Magnetic field','Magnetic field spatial gradient'},'FontSize',12);
set(gca, 'TickDir', 'out','box','off')
%% 2D model of magnetic field
b0=4;
L=4;
R=0.5;

figure()
[x,y]=meshgrid(-5:0.1:5);
z=(b0/2).*((((L/2)-x)./((R^2)+(L/2-x).^2).^0.5)+(L/2+x)./((R^2)+(L./2+x).^2).^0.5);
contour(x,y,z,101)
rectangle('Position',[-2 -0.5 4 1],'linewidth',1)
set(get(colorbar,'label'),'string','Magnetic field strength, B_{0} (T)','FontSize', 11)
title('2D Magnetic Field Variation for an MRI machine with a static field of 4 tesla, length of 4 meters and bore radius of 0.5 meters.')
xlabel('Z-axis (m)')
ylabel('X-axis (m)')
set(gca, 'TickDir', 'out','box','off')

[x,y]=meshgrid(-5:0.1:5);
z=(b0/2).*((((L/2)-x)./((R^2)+(L/2-x).^2).^0.5)+(L/2+x)./((R^2)+(L./2+x).^2).^0.5);
dz1=gradient(z,0.1);
figure()
contour(x,y,dz1,101)
rectangle('Position',[-2 -0.5 4 1],'linewidth',1)
set(get(colorbar,'label'),'string','Magnetic field Spatial Gradient, dB_{0}/dx (T/m)','FontSize', 11);
title('2D Magnetic Field Spatial Gradient using Numerical Methods for an MRI machine with a static field of 4 tesla, length of 4 meters and bore radius of 0.5 meters.')
xlabel('Z-axis (m)')
ylabel('X-axis (m)')
set(gca, 'TickDir', 'out','box','off')

figure()
[x,y]=meshgrid(-5:0.1:5);
dz=(4*b0*R^2).*(-(L^2-4*L.*x+4*(R^2+x.^2)).^(-3/2) + (L^2+4*L.*x+4*(R^2 + x.^2)).^(-3/2));
contour(x,y,dz,101)
set(get(colorbar,'label'),'string','Magnetic field Spatial Gradient, dB_{0}/dx (T/m)','FontSize', 11)
rectangle('Position',[-2 -0.5 4 1],'linewidth',1)
title('2D Magnetic Field Spatial Gradient using Analytical Methods for an MRI machine with a static field of 4 tesla, length of 4 meters and bore radius of 0.5 meters.')
xlabel('Z-axis (m)')
ylabel('X-axis (m)')
set(gca, 'TickDir', 'out','box','off')

figure()
x=linspace(-5,5,101);
chk=(dz-dz1); %Analytical minus Numerical
y=chk(1,:);
plot(x,y,'-o');
title('Difference in Analytical and Numerical Spatial Gradient Calulation for an MRI machine with a static field of 4 tesla, length of 4 meters and bore radius of 0.5 meters.')
xlabel('Z-axis (m)')
ylabel('Difference in Gradient Values')
xline(2,':')
xline(-2,':')
set(gca, 'TickDir', 'out','box','off')





%% 1 Point, Different X - needle like
z=-2; % position
theta=-45; %Angle to field
X=linspace(0,1.2e-5,1000); %Susceptibility
a1=0.05; %polar axis 'radius' - meters length=2*a1
a3=0.005; %a3=a2 % radius - meters 
m=a1/a3;

b0=4; %MR machine properties
L=4; %MR machine properties
R=0.5; %MR machine properties


if m<1
    dm1=(1/((1-(m^2))))*(1-(m/((1-m^2)^0.5))*acosd((m))); %stoner
    dm2=(1/(2*((m^2)-1)))*(m^2-(m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))); %stoner
else 
    dm1=(1/((m^2)-1))*((m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))-1); %stoner
    dm2=(1/(2*((m^2)-1)))*(m^2-(m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))); %stoner
end
Check=dm1+dm2+dm2;
dm1=real(dm1);
dm2=real(dm2);
v=pi*(4/3)*(a3^2)*(a1); % Ellipsoid Volume


z1=z-a1; %End Point 1
z2=z+a1; %End Point 2
B1=(b0/2).*((((L/2)-z1)./((R^2)+(L/2-z1).^2).^0.5)+(L/2+z1)./((R^2)+(L./2+z1).^2).^0.5); %Field Strength x-a1
B2=(b0/2).*((((L/2)-z2)./((R^2)+(L/2-z2).^2).^0.5)+(L/2+z2)./((R^2)+(L./2+z2).^2).^0.5); %Field Strength x+a1
B=(B1+B2)/2; %Average Field Strength
dB1=(4*b0*R^2).*(-(L^2-4*L.*z1+4*(R^2+z1.^2)).^(-3/2)+(L^2+4*L.*z1+4*(R^2+z1.^2)).^(-3/2)); %Gradient x-a1
dB2=(4*b0*R^2).*(-(L^2-4*L.*z2+4*(R^2+z2.^2)).^(-3/2)+(L^2+4*L.*z2+4*(R^2+z2.^2)).^(-3/2)); %Gradient x+a1
dB=(dB1+dB2)/2; %Average Gradient
u=1.2566*10^-6;

Ty=zeros(1,length(X));
for i=1:length(X)
    Ty(i)=(((X(i).^2).*v*(B^2)*cos(theta).*sin(theta))./u)*((dm1-dm2)./((1+X(i).*dm2)*(1+X(i).*dm1)));
end 
figure()
plot(X,Ty)
title('Torque experienced by a needle-like object when the magnetic susceptibility is varied')
xlabel('Volume Magnetic Susceptibility')
ylabel('Torque experienced (N \bullet m)')
set(gca, 'TickDir', 'out','box','off')

Fz=zeros(1,length(X));
for i=1:length(X)
    Fz(i)=(X(i).*v*B*dB./u).*((((cos(theta))^2)/(1+X(i).*dm1))+(((sin(theta))^2/(1+X(i).*dm2))));
end
figure()
plot(X,Fz)
title('Force experienced by a needle-like object when the magnetic susceptibility is varied')
xlabel('Volume Magnetic Susceptibility')
ylabel('Force experienced (N)')
set(gca, 'TickDir', 'out','box','off')

%INCREASE IN SUSCEPTIBILITY RANGE
X=linspace(0,50,1000); %Susceptibility
Ty=zeros(1,length(X));
for i=1:length(X)
    Ty(i)=(((X(i).^2).*v*(B^2)*cos(theta).*sin(theta))./u)*((dm1-dm2)./((1+X(i).*dm2)*(1+X(i).*dm1)));
end 
figure()
plot(X,Ty)
title('Torque experienced by a needle-like object when the magnetic susceptibility is varied')
xlabel('Volume Magnetic Susceptibility')
ylabel('Torque experienced (N \bullet m)')
set(gca, 'TickDir', 'out','box','off')

Fz=zeros(1,length(X));
for i=1:length(X)
    Fz(i)=(X(i).*v*B*dB./u).*((((cos(theta))^2)/(1+X(i).*dm1))+(((sin(theta))^2/(1+X(i).*dm2))));
end
figure()
plot(X,Fz)
title('Force experienced by a needle-like object when the magnetic susceptibility is varied')
xlabel('Volume Magnetic Susceptibility')
ylabel('Force experienced (N)')
set(gca, 'TickDir', 'out','box','off')

%% Same centre point, Same X, differing lengths - needle like
z=-2; %Centre Point
theta=-45; 
X=6e-4; %Susceptibility

a1=linspace(0,5,1000); %polar axis - meters
a3=0.005; %a3=a2 % radius - meters 
m=zeros(1,length(a1));
for i=1:length(a1)
    m(i)=a1(i)./a3;
end 

b0=4; %MR machine properties
L=4; %MR machine properties
R=0.5; %MR machine properties

dm1=zeros(1,length(a1));
dm2=zeros(1,length(a1));
for i=1:length(a1)
    if m(i)<1
        dm1(i)=real((1./((1-(m(i).^2)))).*(1-(m(i)./((1-m(i).^2)^0.5)).*acosd((m(i))))); %stoner
        dm2(i)=real((1./(2*((m(i).^2)-1))).*(m(i).^2-(m(i)./((m(i).^2-1)^0.5))*log((m(i)+(m(i).^2-1)^0.5)))); %stoner
    else
        dm1(i)=real((1/((m(i).^2)-1)).*((m(i)./((m(i).^2-1)^0.5))*log((m(i)+(m(i).^2-1)^0.5))-1)); %stoner
        dm2(i)=real((1/(2*((m(i).^2)-1))).*(m(i).^2-(m(i)./((m(i).^2-1)^0.5))*log((m(i)+(m(i).^2-1)^0.5)))); %stoner
    end
end

v=zeros(1,length(a1));
for i=1:length(a1)
    v(i)=pi*(4/3)*(a3^2).*(a1(i)); %Volume
end

z1=zeros(1,length(a1));
z2=zeros(1,length(a1));
B1=zeros(1,length(a1));
B2=zeros(1,length(a1));
B=zeros(1,length(a1));
dB1=zeros(1,length(a1));
dB2=zeros(1,length(a1));
dB=zeros(1,length(a1));
for i=1:length(a1)
    z1(i)=z-a1(i); %End Point 1
    z2(i)=z+a1(i); %End Point 2
    B1(i)=(b0/2).*((((L/2)-z1(i))./((R^2)+(L/2-z1(i)).^2).^0.5)+(L/2+z1(i))./((R^2)+(L./2+z1(i)).^2).^0.5); %Field Strength x-a1
    B2(i)=(b0/2).*((((L/2)-z2(i))./((R^2)+(L/2-z2(i)).^2).^0.5)+(L/2+z2(i))./((R^2)+(L./2+z2(i)).^2).^0.5); %Field Strength x+a1
    B(i)=(B2(i)+B1(i))./2; %Average Field Strength
    dB1(i)=(4*b0*R^2).*(-(L^2-4*L.*z1(i)+4*(R^2+z1(i).^2)).^(-3/2)+(L^2+4*L.*z1(i)+4*(R^2+z1(i).^2)).^(-3/2)); %Gradient x-a1
    dB2(i)=(4*b0*R^2).*(-(L^2-4*L.*z2(i)+4*(R^2+z2(i).^2)).^(-3/2)+(L^2+4*L.*z2(i)+4*(R^2+z2(i).^2)).^(-3/2)); %Gradient x+a1
    dB(i)=(dB2(i)+dB1(i))./2; %Average Gradient
end
u=1.2566*10^-6;
Ty=zeros(1,length(a1));
for i=1:length(a1)
    Ty(i)=(((X.^2).*v(i).*(B(i).^2).*cosd(theta).*sind(theta))./u)*((dm1(i)-dm2(i))./((1+X.*dm2(i))*(1+X.*dm1(i))));
end 
figure()
plot(2*a1,Ty)
yline(0,':');
title('Torque experienced by a needle-like object when its length is varied')
xlabel('Length (m)')
ylabel('Torque (N \bullet m)')
set(gca, 'TickDir', 'out','box','off')

Fz=zeros(1,length(a1));
for i=1:length(a1)
    Fz(i)=(X.*v(i)*B(i).*dB(i)./u).*((((cosd(theta))^2)/(1+X.*dm1(i)))+(((sind(theta))^2/(1+X.*dm2(i)))));
end
figure()
plot(2*a1,Fz)
yline(0,':');
title('Force experienced by a needle-like object when its length is varied')
xlabel('Length (m)')
ylabel('Force experienced (N)')
set(gca, 'TickDir', 'out','box','off')
%% Different centre point, Same X, Same lengths - needle like
z=linspace(-5,5,1000); %Centre Point
theta=-45; 
X=6e-4; %Susceptibility
a1=0.05; %polar axis - meters
a3=0.005; %a3=a2 % radius - meters 
m=a1/a3;

b0=4; %MR machine properties
L=4; %MR machine properties
R=0.5; %MR machine properties


if m<1
    dm1=(1/((1-(m^2))))*(1-(m/((1-m^2)^0.5))*acosd((m))); %stoner
    dm2=(1/(2*((m^2)-1)))*(m^2-(m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))); %stoner
else 
    dm1=(1/((m^2)-1))*((m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))-1); %stoner
    dm2=(1/(2*((m^2)-1)))*(m^2-(m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))); %stoner
end
Check2=dm1+dm2+dm2;
dm1=real(dm1);
dm2=real(dm2);

v=pi*(4/3)*(a3^2)*(a1); % Ellipsoid Volume

x1=zeros(1,length(z));
x2=zeros(1,length(z));
B1=zeros(1,length(z));
B2=zeros(1,length(z));
B=zeros(1,length(z));
dB1=zeros(1,length(z));
dB2=zeros(1,length(z));
dB=zeros(1,length(z));
for i=1:length(z)
    z1(i)=z(i)-a1; %End Point 1
    z2(i)=z(i)+a1; %End Point 2
    B1(i)=(b0/2).*((((L/2)-z1(i))./((R^2)+(L/2-z1(i)).^2).^0.5)+(L/2+z1(i))./((R^2)+(L./2+z1(i)).^2).^0.5); %Field Strength x-a1
    B2(i)=(b0/2).*((((L/2)-z2(i))./((R^2)+(L/2-z2(i)).^2).^0.5)+(L/2+z2(i))./((R^2)+(L./2+z2(i)).^2).^0.5); %Field Strength x+a1
    B(i)=(B1(i)+B2(i))./2; %Average Field Strength
    dB1(i)=(4*b0*R^2).*(-(L^2-4*L.*z1(i)+4*(R^2+z1(i).^2)).^(-3/2)+(L^2+4*L.*z1(i)+4*(R^2+z1(i).^2)).^(-3/2)); %Gradient x-a1
    dB2(i)=(4*b0*R^2).*(-(L^2-4*L.*z2(i)+4*(R^2+z2(i).^2)).^(-3/2)+(L^2+4*L.*z2(i)+4*(R^2+z2(i).^2)).^(-3/2)); %Gradient x+a1
    dB(i)=(dB1(i)+dB2(i))./2; %Average Gradient
end
u=1.2566*10^-6;

Ty=zeros(1,length(z));
for i=1:length(z)
    Ty(i)=(((X.^2).*v.*(B(i).^2).*cosd(theta).*sind(theta))./u)*((dm1-dm2)./((1+X.*dm2)*(1+X.*dm1)));
end 
figure()
plot(z,Ty)
xline(0,':');
yline(0,':');
title('Torque experienced by a needle-like object when the centre point of the object is varied')
xlabel('Centre point along Z axis (m)')
ylabel('Torque (N \bullet m)')
set(gca, 'TickDir', 'out','box','off')

Fz=zeros(1,length(z));
for i=1:length(z)
    Fz(i)=(X.*v*B(i).*dB(i)./u).*((((cosd(theta))^2)/(1+X.*dm1))+(((sind(theta))^2/(1+X.*dm2))));
end
figure()
plot(z,Fz)
xline(0,':');
yline(0,':');
title('Force experienced by a needle-like object when the centre point of the object is varied')
xlabel('Centre point along Z axis (m)')
ylabel('Force (N)')
set(gca, 'TickDir', 'out','box','off')

%% 1 Point, Different theta - needle like
z=-2; % position
theta=linspace(0,180,181);
X=6e-4; %Susceptibility
a1=0.05; %polar axis radius - meters length=2*a1
a3=0.005; %a3=a2 % radius - meters 
m=a1/a3;

b0=4; %MR machine properties
L=4; %MR machine properties
R=0.5; %MR machine properties

% Bint=X*B
% Bsat=5
% if Bint > Bsat
%     B=Bsat
% end

if m<1
    dm1=(1/((1-(m^2))))*(1-(m/((1-m^2)^0.5))*acosd((m))); %stoner
    dm2=(1/(2*((m^2)-1)))*(m^2-(m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))); %stoner
else 
    dm1=(1/((m^2)-1))*((m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))-1); %stoner
    dm2=(1/(2*((m^2)-1)))*(m^2-(m/((m^2-1)^0.5))*log((m+(m^2-1)^0.5))); %stoner
end
Check=dm1+dm2+dm2;
dm1=real(dm1);
dm2=real(dm2);
v=pi*(4/3)*(a3^2)*(a1); % Ellipsoid Volume


z1=z-a1; %End Point 1
z2=z+a1; %End Point 2
B1=(b0/2).*((((L/2)-z1)./((R^2)+(L/2-z1).^2).^0.5)+(L/2+z1)./((R^2)+(L./2+z1).^2).^0.5); %Field Strength x-a1
B2=(b0/2).*((((L/2)-z2)./((R^2)+(L/2-z2).^2).^0.5)+(L/2+z2)./((R^2)+(L./2+z2).^2).^0.5); %Field Strength x+a1
B=(B1+B2)/2; %Average Field Strength
dB1=(4*b0*R^2).*(-(L^2-4*L.*z1+4*(R^2+z1.^2)).^(-3/2)+(L^2+4*L.*z1+4*(R^2+z1.^2)).^(-3/2)); %Gradient x-a1
dB2=(4*b0*R^2).*(-(L^2-4*L.*z2+4*(R^2+z2.^2)).^(-3/2)+(L^2+4*L.*z2+4*(R^2+z2.^2)).^(-3/2)); %Gradient x+a1
dB=(dB1+dB2)/2; %Average Gradient
u=1.2566*10^-6;

Ty=zeros(1,length(theta));
for i=1:length(theta)
    Ty(i)=(((X.^2).*v*(B^2)*cosd(theta(i)).*sind(theta(i)))./u)*((dm1-dm2)./((1+X.*dm2)*(1+X.*dm1)));
end 
figure()
plot(theta,Ty)
title('Torque experienced by a needle-like object when the angle between the object and magnetic field is varied')
xlabel('Theta (Degrees)')
ylabel('Torque experienced (N \bullet m)')
yline(0,':');
set(gca, 'TickDir', 'out','box','off')

Fz=zeros(1,length(theta));
for i=1:length(theta)
    Fz(i)=(X*v*B*dB/u).*((((cosd(theta(i))).^2)./(1+X*dm1))+(((sind(theta(i))).^2./(1+X*dm2))));
end
figure()
plot(theta,Fz)
title('Force experienced by a needle-like object when the angle between the object and magnetic field is varied')
xlabel('Theta (Degrees)')
ylabel('Force experienced (N)')
set(gca, 'TickDir', 'out','box','off')
