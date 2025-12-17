load('inv_pend_measurements.mat')
syms x x_dot x_ddot phi phi_dot phi_ddot

t = measurements(1,:);
E_tilde=measurements(2,:);
xi = measurements(3:6,:);
F = measurements(7,:);
Fd = measurements(8,:);
figure (1)
plot(t,F);
title('u beavatkozó jel');grid on

figure(2)
subplot(4,1,1);
plot(t,xi(1,:));grid on
title('x pozicio','Interpreter','none');

subplot(4,1,2);
plot(t,xi(2,:));grid on
title('phi szogkiteres','Interpreter','none');

subplot(4,1,3);
plot(t,xi(3,:));grid on
title('x_d sebesseg','Interpreter','none');

xi(4,1:100)=xi(4,101);% elején a zavarást törlöm
subplot(4,1,4);
plot(t,xi(4,:));grid on
title('phi_d szogsebesseg','Interpreter','none');


E_tilde(1:80)=E_tilde(81);% elején a zavarást törlöm

figure(3);
plot(t,E_tilde);grid on
title('Képzetes energia')


phi=xi(2,:);
phi_new=mod(phi-pi(),2*pi())-pi();


figure(4)
subplot(2,1,1);
plot(t,xi(2,:));grid on
title('phi');
subplot(2,1,2);
plot(t,phi_new,'o', 'MarkerSize', 0.5, 'MarkerFaceColor', 'b');
title('phi [-pi,+pi] intervelumon');grid on

figure(5)
plot(t,Fd);grid on
title('Terhelésbecslő')

%export excel
data = [t' xi'];  % Excelben oszlopok: t, xi1, xi2, xi3, xi4

% Oszlopnevek
varNames = {'t','x','phi','x_dot','phi_dot'};
T = array2table(data,'VariableNames',varNames);
writetable(T,'xi_data.xlsx');