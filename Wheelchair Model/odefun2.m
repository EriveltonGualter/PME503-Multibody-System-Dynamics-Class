function yd = odefun( t, y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
        
    w = sys_wheelchair;
    w.F = 0;
    w.Fr = 0;
    
    M =[w.Jr+(w.Mr+w.M)*(w.R^2)     w.M*w.R*w.l*cos(y(1))
        w.M*w.R*w.l*cos(y(1))   w.Jc+w.M*w.l^2];

    K = [ -w.M*w.R*w.l*(y(2))^2*sin(y(1)) 
          -w.M*w.g*w.l*sin(y(1))          ];

      
    A = inv(M)*( [w.F-w.Fr  -w.F]' - K );

    yd = [y(2); A(2,1); y(4); A(1,1)];
    
end

