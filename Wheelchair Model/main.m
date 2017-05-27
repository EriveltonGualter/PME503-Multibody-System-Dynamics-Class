clear all, close all

w = sys_wheelchair();

y0 = [0, 0];
angle_w = pi/2;
tf = 8; 

options1 = odeset('RelTol',1e-8,'AbsTol',1e-8,'Events',@event_ode);
[T1, Yout1] = ode45(@odefun,[0 tf],y0, options1);

y0 = [angle_w, 0, Yout1(end,1)/0.3048, Yout1(end,2)];
options2 = odeset('RelTol',1e-8,'AbsTol',1e-8);
[T2, Yout2] = ode45(@odefun2,[T1(size(T1,1))+0.1 tf],y0, options2);

data1.ti = T1;
data1.phi = angle_w*ones(size(T1));
data1.phid = zeros(size(T1));
data1.theta = Yout1(:,1)/0.3048;
data1.thetad = Yout1(:,2);

data2.ti = T2;
data2.phi = Yout2(:,1);
data2.phid = Yout2(:,2);
data2.theta = Yout2(:,3);
data2.thetad = Yout2(:,4);

data.ti = vertcat(data1.ti ,data2.ti);
data.phi = vertcat(data1.phi ,data2.phi);
data.phid = vertcat(data1.phid ,data2.phid);
data.theta = vertcat(data1.theta ,data2.theta);
data.thetad = vertcat(data1.thetad ,data2.thetad);


simulation(data);

% figure(2);
% pt(data);