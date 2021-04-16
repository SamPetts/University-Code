clear
format short g
N = 100;
x=linspace(-pi,pi,N)';
x=(-pi:2*pi/(N-1):pi)';
y = sin(x);

% figure(), plot(x,y), xlabel('x axis'), ylabel('y axis'), xlim([-pi pi])
% set(gca, 'TickDir', 'out','box','off')
% hline=refline(0,0);
% hline.LineStyle = ':';
% title(['A Sine function.'])

% sf = 0.1;
% y = sin_scale(x,sf);
% figure(), plot(x,y), xlabel('x axis'), ylabel('y axis'), xlim([-pi pi])
% set(gca, 'TickDir', 'out','box','off')
% hline=refline(0,0);
% hline.LineStyle = ':';
% title(['A Sine function with scale factor 0.1.']);


sf=[0.1 0.5 1 2]; % Scale factor values in an array named sf
N_sf = numel(sf); % Number of elements within sf (ML intrinsic function)
sin_array = zeros(N,N_sf);
%Initialise an array of zeros to store data. % Notice the size of the array is predicted by
%the number of values, N and the number of scale factors to be analysed, N_sf.

for ndx = 1: N_sf
 sin_array(:,ndx) = sin_scale(x,sf(ndx));
end

figure(),plot(x,sin_array), xlabel('x axis'), ylabel('y axis'), xlim([-pi pi])
set(gca, 'TickDir', 'out','box','off')
hline=refline(0,0);
hline.LineStyle = ':';
sf= ('0.1, 0.5, 1, 2');
title(['Multiple Sine functions with different scale factors, with limits = [-\pi \pi]; Scale factors = ',num2str(sf),'.'])
legend ('0.1','0.5','1','2')


