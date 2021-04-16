clear
format short g


eV=1.6e-19;
V=[1*eV 2*eV];
A=1e-10;
L=[130*A 150*A];
E=linspace(0,0.3,100);

figure()

hold on 
fplot(@(E) A3Q2F2(E*1.6E-19,V(1),L(1)), 'color', 'r');
fplot(@(E) A3Q2F1(E*1.6E-19,V(1),L(1)), 'color', 'g');
xlim([0 0.3]);
ylim([-4 4]);
% title('cot');
xlabel('Energy (eV)');
ylabel('y(E)');
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
legend('Even Solutions - Equation 23', 'Odd Solutions - Equation 22')
lgd=legend;
lgd.FontSize=10;
hold off
title('Odd and Even solutions for a Finite Quantum Well')

f1=@(E) A3Q2F1(E*1.6E-19,V(1),L(1));
f2=@(E) A3Q2F2(E*1.6E-19,V(1),L(1));

rootint1=Bracketing(f1,0,0.3,100,1e-10);
rootint2=Bracketing(f2,0,0.3,100,1e-10);
tol=1e-6;
imax=20;
r1=Bisec(f1,E(rootint1(1)),E(rootint1(2)),imax,tol);
r2=Bisec(f1,E(rootint1(5)),E(rootint1(6)),imax,tol);
r3=Bisec(f2,E(rootint2(1)),E(rootint2(2)),imax,tol);
r4=Bisec(f2,E(rootint2(5)),E(rootint2(6)),imax,tol);



AA=char(197);

figure()
hold on 
fplot(@(E) A3Q2F2(E*1.6E-19,V(1),L(1)), 'color', 'r');
fplot(@(E) A3Q2F1(E*1.6E-19,V(1),L(1)), 'color', 'g');
plot(r1,0,'o','color','k')
plot(r2,0,'o','color','k')
plot(r3,0,'o','color','k')
plot(r4,0,'o','color','k')
xlabel('Energy (eV)');
ylabel('y axis');
title(['Finite Quantum Well Solutions with a Well Width of 130',AA,' and Well Depth of 1eV']);
xlim([0 0.3]);
ylim([-4 4]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off')
legend('Even Solutions', 'Odd Solutions')
lgd=legend;
lgd.FontSize=10;
hold off

Roots1=[r1; r2; r3; r4;]; 
T = array2table(Roots1,'VariableNames',{'Solutions in eV'});

title(['Energy Eigenvalues in eV for a quantum well with a Well Width of 130',AA,' and Well Depth of 1eV']);

disp(T)
%%

E=linspace(0,0.4,100);


f1=@(E) A3Q2F1(E*1.6E-19,V(2),L(1));
f2=@(E) A3Q2F2(E*1.6E-19,V(2),L(1));

rootint1=Bracketing(f1,0,0.4,100,1e-10);
rootint2=Bracketing(f2,0,0.4,100,1e-10);
tol=1e-6;
imax=20;
r1=Bisec(f1,E(rootint1(1)),E(rootint1(2)),imax,tol);
r2=Bisec(f1,E(rootint1(5)),E(rootint1(6)),imax,tol);
r3=Bisec(f2,E(rootint2(1)),E(rootint2(2)),imax,tol);
r4=Bisec(f2,E(rootint2(5)),E(rootint2(6)),imax,tol);
Roots2=[r1; r2; r3; r4]; 


figure()
hold on 
fplot(@(E) A3Q2F2(E*1.6E-19,V(2),L(1)), 'color', 'r');
fplot(@(E) A3Q2F1(E*1.6E-19,V(2),L(1)), 'color', 'g');
plot(r1,0,'o','color','k')
plot(r2,0,'o','color','k')
plot(r3,0,'o','color','k')
plot(r4,0,'o','color','k')
xlabel('Energy (eV)');
ylabel('y(E)');

title(['Finite Quantum Well Solutions with a Well Width of 130',AA,' and Well Depth of 2eV']);
xlim([0 0.4]);
ylim([-4 4]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off')
legend('Even Solutions', 'Odd Solutions')
lgd=legend;
lgd.FontSize=10;
hold off


T = array2table(Roots2,'VariableNames',{'Solutions in eV'});

disp(T)

%%

E=linspace(0,0.3,100);

f1=@(E) A3Q2F1(E*1.6E-19,V(1),L(2));
f2=@(E) A3Q2F2(E*1.6E-19,V(1),L(2));

rootint1=Bracketing(f1,0,0.3,100,1e-10);
rootint2=Bracketing(f2,0,0.3,100,1e-10);
tol=1e-6;
imax=20;
r1=Bisec(f1,E(rootint1(1)),E(rootint1(2)),imax,tol);
r2=Bisec(f1,E(rootint1(5)),E(rootint1(6)),imax,tol);
r3=Bisec(f2,E(rootint2(1)),E(rootint2(2)),imax,tol);
r4=Bisec(f2,E(rootint2(5)),E(rootint2(6)),imax,tol);
Roots3=[r1; r2; r3; r4]; 

figure()
hold on 
fplot(@(E) A3Q2F2(E*1.6E-19,V(1),L(2)), 'color', 'r');
fplot(@(E) A3Q2F1(E*1.6E-19,V(1),L(2)), 'color', 'g');
plot(r1,0,'o','color','k')
plot(r2,0,'o','color','k')
plot(r3,0,'o','color','k')
plot(r4,0,'o','color','k')
xlabel('Energy (eV)');

ylabel('y(E)');
xlim([0 0.3]);
hold off
title(['Finite Quantum Well Solutions with a Well Width of 150',AA,' and Well Depth of 1eV']);
xlim([0 0.3]);
ylim([-4 4]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off')
legend('Even Solutions', 'Odd Solutions')
lgd=legend;
lgd.FontSize=10;
hold off


T = array2table(Roots3,'VariableNames',{'Solutions in eV'});

disp(T)
%%

E=linspace(0,0.3,100); 
f1=@(E) A3Q2F1(E*1.6E-19,V(2),L(2));
f2=@(E) A3Q2F2(E*1.6E-19,V(2),L(2));

rootint1=Bracketing(f1,0,0.3,100,1e-10);
rootint2=Bracketing(f2,0,0.3,100,1e-10);
tol=1e-6;
imax=20;
r1=Bisec(f1,E(rootint1(1)),E(rootint1(2)),imax,tol);
r2=Bisec(f1,E(rootint1(5)),E(rootint1(6)),imax,tol);
r3=Bisec(f2,E(rootint2(1)),E(rootint2(2)),imax,tol);
r4=Bisec(f2,E(rootint2(5)),E(rootint2(6)),imax,tol);
Roots4=[r1; r2; r3; r4]; 

figure()
hold on 
fplot(@(E) A3Q2F2(E*1.6E-19,V(2),L(2)), 'color', 'r');
fplot(@(E) A3Q2F1(E*1.6E-19,V(2),L(2)), 'color', 'g');
plot(r1,0,'o','color','k')
plot(r2,0,'o','color','k')
plot(r3,0,'o','color','k')
plot(r4,0,'o','color','k')
xlabel('Energy (eV)');
ylabel('y(E)');
xlim([0 0.3]);
hold off
title(['Finite Quantum Well Solutions with a Well Width of 150',AA,' and Well Depth of 2eV']);
xlim([0 0.3]);
ylim([-4 4]);
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off')
legend('Even Solutions', 'Odd Solutions')
lgd=legend;
lgd.FontSize=10;
hold off

T = array2table(Roots4,'VariableNames',{'Solutions in eV'});

disp(T)