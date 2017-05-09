% Parâmetros
c1 = 0.5;
l1 = 1;
c2 = 0.5;
l2 = 1;
m1 = 1;
m2 = 1;
J1 = m1*l1^2/12;
J2 = m2*l2^2/12;
g = 9.81;

%% Condições iniciais
% x0 = [alfa0; beta0; alfad0; betad0]
z0 = [0; 0; 0; 0];

% Integração numérica
options = odeset('AbsTol',1E-8,'RelTol',1E-8);
[T, Z] = ode45(@robo_der2, [0 100], z0, options);

figure
plot(T, Z(:,1));
title('Alfa')
xlabel('tempo [s]')
ylabel('[rad]')

figure
plot(T, Z(:,2));
title('Beta')
xlabel('tempo [s]')
ylabel('[rad]')





