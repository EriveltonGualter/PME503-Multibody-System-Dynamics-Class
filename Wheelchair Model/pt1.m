function [] = pt1(data)
    %% Plot Phi, Phid, Theta, and Thetad
    hold on;
    subplot(211)          % Subplot Angle of wheelchair
    plot(data.ti, data.theta*0.3048);
        title('Deslocamento','interpreter','latex');
        xlabel('Tempo [s]','interpreter','latex'); ylabel('m');

    hold on;                % Sublot Angle of wheel
    subplot(212)     
    plot(data.ti, data.thetad)
        title('Velocidade','interpreter','latex');
        xlabel('Tempo [s]','interpreter','latex');  ylabel('m/s','interpreter','latex');
end