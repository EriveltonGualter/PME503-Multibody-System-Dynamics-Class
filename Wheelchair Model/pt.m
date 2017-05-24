function [] = pt(data)
    %% Plot Phi, Phid, Theta, and Thetad
    subplot(221)          % Subplot Angle of wheelchair
    plot(data.ti, data.phi,'LineWidth',2);
        title('Angulo da Cadeira de Rodas $\phi$','interpreter','latex');
        xlabel('Tempo [s]','interpreter','latex'); ylabel('$\phi$ [rad]','interpreter','latex');

    hold on;                % Sublot Angle of wheel
    subplot(222)     
    plot(data.ti, data.phid,'LineWidth',2);
        title('Velocidade Angular da Cadeira de Rodas $\dot{\phi}$ [rad/s2]','interpreter','latex');
        xlabel('Tempo [s]','interpreter','latex'); ylabel('$\dot{\phi}$ [rad/s]','interpreter','latex');

    hold on;
    subplot(223)          % Subplot Angle of wheelchair
    plot(data.ti, data.theta*0.3048,'LineWidth',2);
        title('Deslocamento','interpreter','latex');
        xlabel('Tempo [s]','interpreter','latex'); ylabel('m');

    hold on;                % Sublot Angle of wheel
    subplot(224)     
    plot(data.ti, data.thetad,'LineWidth',2);
        title('Velocidade','interpreter','latex');
        xlabel('Tempo [s]','interpreter','latex');  ylabel('m/s','interpreter','latex');
end