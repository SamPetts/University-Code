clear
format shortg
a=[1E-9 10E-9]; 
n=[1 2 3 4];

EnEig1(:,:)=En(n,a(1)); %Eigenvalues a=1nm
EnEig10(:,:)=En(n,a(2)); %Eigenvalues a=10nm

figure()
fplot(@(x) fpsi(n(1),a(1),x), [0 2E-9], 'color', 'g');
hold on
fplot(@(x) fpsi(n(2),a(1),x), [0 2E-9]);
fplot(@(x) fpsi(n(3),a(1),x), [0 2E-9]);
fplot(@(x) fpsi(n(4),a(1),x), [0 2E-9]);
title('Eigenfunctions for a well width of 1nm');
xlabel('Well width');
ylabel('\Psi (x)');
xticks([0,a(1),2E-9])
xticklabels({'0','a','2a'})
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off','YTick', []);
legend({['n=1, Eigenvalue =',num2str(EnEig1(1))],['n=2, Eigenvalue =',num2str(EnEig1(2))],['n=3, Eigenvalue =',num2str(EnEig1(3))],['n=4, Eigenvalue =',num2str(EnEig1(4))]});
hold off

figure()
fplot(@(x) fpsi(n(1),a(2),x), [0 20E-9], 'color', 'g');
hold on
fplot(@(x) fpsi(n(2),a(2),x), [0 20E-9]);
fplot(@(x) fpsi(n(3),a(2),x), [0 20E-9]);
fplot(@(x) fpsi(n(4),a(2),x), [0 20E-9]);
title('a=10')
xticks([0,a(2),2*a(2)]);
xticklabels({'0','a','2a'});
title('Eigenfunctions for a=10nm')
xlabel('Well width');
ylabel('\Psi (x)');
hline = refline(0, 0);
set(hline,'LineStyle','--','color', 'k');
set(gca, 'TickDir', 'out','box','off','YTick', []);
legend({['n=1, Eigenvalue =',num2str(EnEig10(1))],['n=2, Eigenvalue =',num2str(EnEig10(2))],['n=3, Eigenvalue =',num2str(EnEig10(3))],['n=4, Eigenvalue =',num2str(EnEig10(4))]});
hold off

A=[1 EnEig1(1) EnEig1(2) EnEig1(3) EnEig1(4); 10 EnEig10(1) EnEig10(2) EnEig10(3) EnEig10(4)]; %Table setup
T = array2table(A,'VariableNames',{'A (nm)','n=1','n=2','n=3','n=4'});
title = 'Energy Eigenvalues in eV';

fprintf('%40s\n',title) % allocate 40 character spaces for the title.
fprintf(1, '\n');
disp(T)

