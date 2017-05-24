function [value,isterminal,direction] = event_ode(t,y)
    
    w = sys_wheelchair();
    CG = solveCG(w.Uh, w.Um);
    a_max = 2; % CG(1,1)/CG(2,1)*9.8; % corrigir
    
    if y(2) > 0
        w.Fr = 0; %abs(w.Fr);
    else
        w.Fr = 0;
    end
    
    if t < 2
        status = 1;
    else
        if t > 4 && t < 5
            status = 2;
        else
            status = 0;
        end
    end
      

    a_atual = (w.F*(w.Rl/w.R)*status - w.Fr)/(w.M+w.Jr/w.R^2);
    
    if a_atual > a_max 
        value = 0;
    else
        value = a_atual - a_max;
    end
    isterminal = 1;
    direction = 0;
end