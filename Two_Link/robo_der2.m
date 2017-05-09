function [zd] = robo_der2(t, z)
nc = 6;
nr = 4;
f = nc - nr;

alfa = z(1);
beta = z(2);
alfad = z(3);
betad = z(4);

% parâmetros
c1 = 0.5;
l1 = 1;
c2 = 0.5;
l2 = 1;
m1 = 1;
m2 = 1;
J1 = m1*l1^2/12;
J2 = m2*l2^2/12;
g = 9.81;

% Forças
Fx = 0;
Fy = 0;
tau1 = 0;
tau2 = 0;

% Matriz de massa
M = [ J1 + J2 + m2*(c2*cos(alfa + beta) + l1*cos(alfa))^2 + m2*(c2*sin(alfa + beta) + l1*sin(alfa))^2 + c1^2*m1*cos(alfa)^2 + c1^2*m1*sin(alfa)^2, J2 + c2*m2*sin(alfa + beta)*(c2*sin(alfa + beta) + l1*sin(alfa)) + c2*m2*cos(alfa + beta)*(c2*cos(alfa + beta) + l1*cos(alfa));
      J2 + c2*m2*sin(alfa + beta)*(c2*sin(alfa + beta) + l1*sin(alfa)) + c2*m2*cos(alfa + beta)*(c2*cos(alfa + beta) + l1*cos(alfa)),                                                                   m2*c2^2*cos(alfa + beta)^2 + m2*c2^2*sin(alfa + beta)^2 + J2];
 
% Vetor de forças generalzdas de coriolis e centrífugas
k = [alfad*(m2*(alfad*(c2*cos(alfa + beta) + l1*cos(alfa)) + betad*c2*cos(alfa + beta))*(c2*sin(alfa + beta) + l1*sin(alfa)) - m2*(alfad*(c2*sin(alfa + beta) + l1*sin(alfa)) + betad*c2*sin(alfa + beta))*(c2*cos(alfa + beta) + l1*cos(alfa))) - betad*(m2*(c2*cos(alfa + beta) + l1*cos(alfa))*(alfad*c2*sin(alfa + beta) + betad*c2*sin(alfa + beta)) - m2*(c2*sin(alfa + beta) + l1*sin(alfa))*(alfad*c2*cos(alfa + beta) + betad*c2*cos(alfa + beta)));
     betad*(c2*m2*sin(alfa + beta)*(alfad*c2*cos(alfa + beta) + betad*c2*cos(alfa + beta)) - c2*m2*cos(alfa + beta)*(alfad*c2*sin(alfa + beta) + betad*c2*sin(alfa + beta))) + alfad*(c2*m2*sin(alfa + beta)*(alfad*(c2*cos(alfa + beta) + l1*cos(alfa)) + betad*c2*cos(alfa + beta)) - c2*m2*cos(alfa + beta)*(alfad*(c2*sin(alfa + beta) + l1*sin(alfa)) + betad*c2*sin(alfa + beta)))];
 
% Vetor de forças generalizadas não vinculares
ke = [tau1 + (c2*cos(alfa + beta) + l1*cos(alfa))*(Fy - g*m2) - Fx*(c2*sin(alfa + beta) + l1*sin(alfa)) - Fy*cos(alfa + beta)*(c2 - l2) + Fx*sin(alfa + beta)*(c2 - l2) - c1*g*m1*cos(alfa);
      tau2 + c2*cos(alfa + beta)*(Fy - g*m2) - Fx*c2*sin(alfa + beta) - Fy*cos(alfa + beta)*(c2 - l2) + Fx*sin(alfa + beta)*(c2 - l2)];
 
% Derivada dos estados (saída)
qd = [alfad; betad];

qdd = M\(ke - k);

zd = [qd; qdd];
end










