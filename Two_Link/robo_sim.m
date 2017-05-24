% Par�metros
c1 = 0.5;
l1 = 1;
c2 = 0.5;
l2 = 1;
m1 = 1;
m2 = 1;
J1 = m1*l1^2/12;
J2 = m2*l2^2/12;
g = 9.81;

%% Condi��es iniciais
% coordenadas f�sicas
% x = [x1; y1; x2; y2; th1; th2]
x0 = [c1; 0; l1+c2; 0; 0; 0];
% tomar cuidado com as condicoes iniciais. Se adicionar um erro (ex:
% l1+c2+0.1) ou aumenta o tempo de integra��o. Os v�nculos vao se afastar

% derivadas
xd0 = [0; 0; 0; 0; 0; 0];

z0 = [x0; xd0];

%% Integra��o num�rica
options = odeset('AbsTol',1E-8,'RelTol',1E-8); % t toler�ncias de integra��o
[T, Z] = ode45(@robo_der, [0 20], z0, options);

figure
title('Centro de massa')
hold on
plot(Z(:,1),Z(:,2));        % trajetoria braco 1 CG
plot(Z(:,3),Z(:,4),'r');    % trajetoria braco 2 CG
xlabel('x (m)');
ylabel('y (m)');
axis equal
legend('CM barra1','CM barra 2')

