function [zd] = robo_der(t, z)
nc = 6;
nr = 4;
% x = z(1:nc);
x1 = z(1);
y1 = z(2);
x2 = z(3);
y2 = z(4);
th1 = z(5);
th2 = z(6);
xd = z(nc+1:2*nc);
th1d = z(11);
th2d = z(12);

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

Mbb =  [m1,  0,  0,  0,  0,  0;
        0, m1,  0,  0,  0,  0;
        0,  0, m2,  0,  0,  0;
        0,  0,  0, m2,  0,  0;
        0,  0,  0,  0, J1,  0;
        0,  0,  0,  0,  0, J2];

 
Fe = [                                              0;
                                                -g*m1;
                                                   Fx;
                                            Fy - g*m2;
                                          tau1 - tau2;
 tau2 - Fy*cos(th2)*(c2 - l2) + Fx*sin(th2)*(c2 - l2)];
 
 
phi_x = [1, 0,  0,  0,         c1*sin(th1),            0;
        0, 1,  0,  0,        -c1*cos(th1),            0;
        1, 0, -1,  0,  sin(th1)*(c1 - l1), -c2*sin(th2);
        0, 1,  0, -1, -cos(th1)*(c1 - l1),  c2*cos(th2)];
 
 
phi_x_dot =  [0, 0, 0, 0,        c1*th1d*cos(th1),                 0;
              0, 0, 0, 0,        c1*th1d*sin(th1),                 0;
              0, 0, 0, 0, th1d*cos(th1)*(c1 - l1), -c2*th2d*cos(th2);
              0, 0, 0, 0, th1d*sin(th1)*(c1 - l1), -c2*th2d*sin(th2)];

V = [Mbb, phi_x.'; phi_x, zeros(nr,nr)]\[Fe; -phi_x_dot*xd];
% Ax=b
% x = A\b

zd = [xd; V(1:nc)];
end