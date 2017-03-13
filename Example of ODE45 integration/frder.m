function [ yd ] = frder(t, y)
%EDO referente ao problema de frenagem
%   Inputs: t e y.
%   Output: yd

% Lembrando que:
%   y = [s; v];
%   yd = [v ; -0.01*v^2 -0.01*s-2]


s = y(1);   
v = y(2);

sd = v;
vd = -0.01*v^2 - 0.01*s - 2;

yd = [sd; vd];

end

