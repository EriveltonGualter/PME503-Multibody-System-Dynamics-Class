% Equações de movimento de um braço robótico

% Número de coordenadas físicas
nc = 6;

% Número de restrições
nr = 4;

% Número de graus de liberdade
f = nc - nr;

% Parâmetros
syms c1 l1 c2 l2 m1 m2 J1 J2 g

% Forças e momentos aplicados não vinculares
syms Fx Fy tau1 tau2

% Forças e momentos vinculares
syms Fx1 Fy1 Fx2 Fy2

% Coordenadas físicas
syms  x1 y1 x2 y2 th1 th2
syms  x1d y1d x2d y2d th1d th2d

% Coordenadas generalizadas
syms alfa beta
syms alfad betad

% Equações vinculares implícitas
phi = [x1 - c1*cos(th1);
       y1 - c1*sin(th1);
       x1 + (l1-c1)*cos(th1) - x2 + c2*cos(th2);
       y1 + (l1-c1)*sin(th1) - y2 + c2*sin(th2)];
   

Mbb = diag([m1 m1 m2 m2 J1 J2]);

Fe = [0; -m1*g; Fx; -m2*g+Fy; tau1-tau2; tau2+Fy*(l2-c2)*cos(th2)-Fx*(l2-c2)*sin(th2)];

% Matriz de distribuição (referente ao vetor de forças vinculares)
% Fv = Q*g = transpose(-phi_x) 
% onde: g = [Fx1; Fy1; -Fx2; -Fy2]

phi_x = jacobian(phi,[x1 y1 x2 y2 th1 th2]) % derivada parcial em relcao x 
Q = -phi_x.'

% Fv = Ql*[Fx1; Fy1; -Fx2; -Fy2]
Ql = [1, 0, -1,  0;
     0, 1,  0, -1;
     0, 0,  1,  0;
     0, 0,  0,  1;
     c1*sin(th1), -c1*cos(th1), (l1-c1)*sin(th1), -(l1-c1)*cos(th1);
     0, 0, c2*sin(th2), -c2*cos(th2)]
 
% Derivada do phi_x
%  phi_x_dot = zeros(size(phi_x));
 for j = 1:nc
    phi_x_dot(:,j) = jacobian(phi_x(:,j),[x1 y1 x2 y2 th1 th2])*[x1d; y1d; x2d; y2d; th1d; th2d];
 end
 Mbb
 Fe
 phi_x
 phi_x_dot

% Jacobiano global
x = [c1*cos(alfa); 
    c1*sin(alfa);
    l1*cos(alfa) + c2*cos(alfa+beta);
    l1*sin(alfa) + c2*sin(alfa+beta);
    alfa;
    alfa+beta];
    
J = jacobian(x,[alfa beta]);

% Matrix de massa
M = J.'*Mbb*J


% Cálculo da derivada do Jacobiano em relação ao tempo
for j = 1:f 
    Jd(:,j) = jacobian(J(:,j),[alfa beta])*[alfad; betad];
end

% Vetor de forças generalizadas de Coriolis e centrífugas 
k = J.'*Mbb*Jd*[alfad;betad]

% Vetor de forças generalizadas não vinculares
Fe = [0; -m1*g; Fx; -m2*g+Fy; tau1-tau2; tau2+Fy*(l2-c2)*cos(alfa+beta)-Fx*(l2-c2)*sin(alfa+beta)];
ke = J.'*Fe





