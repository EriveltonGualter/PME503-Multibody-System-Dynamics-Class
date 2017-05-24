function [ wheelchair ] = sys_wheelchair()

    wheelchair.Uh = 1.70;
    wheelchair.Um = 70;
    
    wheelchair.Rl = 11*25.4/1000;  
    wheelchair.R = 12*25.4/1000; 
    wheelchair.Mc = 12.71;  
    wheelchair.Mr = 2.546; 
    wheelchair.M  = wheelchair.Mc + 2*wheelchair.Mr +  wheelchair.Um;
    wheelchair.Jr = 0.140; 
    wheelchair.Jc = 1.670;
    
    wheelchair.l = 0.256;
    wheelchair.g = 9.81;
    
%     wheelchair.Fr = 0; 
%     wheelchair.F = 0;   

%     Fase 1
%     wheelchair.Fr = 21; 
%     wheelchair.F = 160;

%     Transição 1
    wheelchair.Fr = 21; 
    wheelchair.F = 160;

 
end