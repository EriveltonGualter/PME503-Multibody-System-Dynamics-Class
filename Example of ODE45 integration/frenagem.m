% 13/03/2017
% Exemplo 1 

TSPAN = [0; 10];    % TSPAN = [T0 TFINAL]   Range
Y0  = [0; 20];      % Y0  = [so; vo];       Condi��es de contorno


% ode45: Solve non-stiff differential equations, medium order method.
[TOUT,YOUT] = ode45('frder',TSPAN,Y0);

% Plot results
hold on
grid

title('Rela��o Deslocamento e Velocidade pelo Tempo');

yyaxis left
plot(TOUT, YOUT(:,1))
xlabel('Tempo (s)');
ylabel('[m]');

yyaxis right
plot(TOUT, YOUT(:,2))
xlabel('Tempo (s)');
ylabel('[m/s]');

legend('Deslocamento','Velocidade');


    