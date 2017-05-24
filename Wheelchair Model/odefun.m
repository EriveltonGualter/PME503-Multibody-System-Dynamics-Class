function yd = odefun( t, y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
        
    w = sys_wheelchair;
    
    
    s = y(1);
    v = y(2);
      
    if t < 2
        status = 1;
    else
        if t > 4 && t < 5
            status = 2;
        else
            status = 0;
        end
    end
      

    
    if v > 0
        w.Fr = abs(w.Fr);
    else
        w.Fr = 0;
    end
    
    sd = v;
    vd = (w.F*(w.Rl/w.R)*status - w.Fr)/(w.M+w.Jr/w.R^2);
    % dv = (F*(Rl/R) - Fr*0.3)/(M+Jr/R^2);
    
    yd = [sd; vd];
end

