dt = 0.1;
t = (length(out.Pitch_Lin.get.Data)-1)*dt;
tt = 0:dt:t;

% Pitch Linear
Pitch_Result_Lin = out.Pitch_Lin.get.Data(:);
Pitch_Deg_Lin = Pitch_Result_Lin(1:length(out.Pitch_Lin.get.Data));
wPitch_Result_Lin = out.wPitch_Lin.get.Data(:);
wPitch_Deg_Lin = wPitch_Result_Lin(1:length(out.wPitch_Lin.get.Data));

% Pitch Non Linear
Pitch_Result_NonLin = out.Pitch_NonLin.get.Data(:);
Pitch_Deg_NonLin = Pitch_Result_NonLin(1:length(out.Pitch_NonLin.get.Data));
wPitch_Result_NonLin = out.wPitch_NonLin.get.Data(:);
wPitch_Deg_NonLin = wPitch_Result_NonLin(1:length(out.wPitch_NonLin.get.Data));

figure(1)
subplot(2,1,1)

plot(tt,Pitch_Deg_Lin);
hold on
plot(tt,Pitch_Deg_NonLin);
grid minor;
xlabel('t[s]');
ylabel('\theta [deg]');
title('Pitch angle \theta');
legend('Linear','Non Linear')
axis([0 t -inf inf]);
yline(-10,'-','\theta_{op}','HandleVisibility','off');
hold off

subplot(2,1,2)
plot(tt,wPitch_Deg_Lin);
hold on
plot(tt,wPitch_Deg_NonLin);
grid minor;
xlabel('t[s]');
ylabel('\omega_\theta [deg/s]');
title('Pitch angular velocity \omega_\theta');
axis([0 t -inf inf]);
legend('Linear','Non Linear')
hold off

% Yaw Linear
Yaw_Result_Lin = out.Yaw_Lin.get.Data(:);
Yaw_Deg_Lin = Yaw_Result_Lin(1:length(out.Yaw_Lin.get.Data));
wYaw_Result_Lin = out.wYaw_Lin.get.Data(:);
wYaw_Deg_Lin = wYaw_Result_Lin(1:length(out.wYaw_Lin.get.Data));

% Yaw Non Linear
Yaw_Result_NonLin = out.Yaw_NonLin.get.Data(:);
Yaw_Deg_NonLin = Yaw_Result_NonLin(1:length(out.Yaw_NonLin.get.Data));
wYaw_Result_NonLin = out.wYaw_NonLin.get.Data(:);
wYaw_Deg_NonLin = wYaw_Result_NonLin(1:length(out.wYaw_NonLin.get.Data));

figure(2)
subplot(2,1,1)
plot(tt,Yaw_Deg_Lin);
hold on
plot(tt,Yaw_Deg_NonLin);
grid minor;
xlabel('t[s]');
ylabel('\psi [deg]');
title('Yaw angle \psi');
axis([0 t -inf inf]);
legend('Linear','Non Linear')
yline(90,'-','\psi_{op}','HandleVisibility','off');
hold off;

subplot(2,1,2)
plot(tt,wYaw_Deg_Lin);
hold on
plot(tt,wYaw_Deg_NonLin);
grid minor;
xlabel('t[s]');
ylabel('\omega_\psi [deg/s]');
title('Yaw angular velocity \omega_\psi');
axis([0 t -inf inf]);
legend('Linear','Non Linear')
hold off;

% Control voltages
Vmp_Result = out.CV.get.Data(:,1);
Vmy_Result = out.CV.get.Data(:,2);

figure(3)
plot(tt,Vmp_Result(1:length(out.CV.get.Data)), tt,Vmy_Result(1:length(out.CV.get.Data)) );
grid minor;
xlabel('t[s]');
ylabel('V');
title('Control voltages');
legend('Vmp', 'Vmy');
axis([0 t -inf inf]);
