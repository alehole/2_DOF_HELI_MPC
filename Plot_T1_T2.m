dt = 0.1;
t = (length(out.Pitch.get.Data)-1)*dt;
tt = 0:dt:t;

% Pitch
Pitch_Result = out.Pitch.get.Data(:);
Pitch_Deg = Pitch_Result(1:length(out.Pitch.get.Data));
wPitch_Result = out.wPitch.get.Data(:);
wPitch_Deg = wPitch_Result(1:length(out.wPitch.get.Data));

figure(1)
subplot(2,1,1)
plot(tt,Pitch_Deg);
grid minor;
xlabel('t[s]');
ylabel('\theta [deg]');
title('Pitch angle \theta');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt,wPitch_Deg);
grid minor;
xlabel('t[s]');
ylabel('\omega_\theta [deg/s]');
title('Pitch angular velocity \omega_\theta');
axis([0 t -inf inf]);

% Yaw
Yaw_Result = out.Yaw.get.Data(:);
Yaw_Deg = Yaw_Result(1:length(out.Yaw.get.Data));
wYaw_Result = out.wYaw.get.Data(:);
wYaw_Deg = wYaw_Result(1:length(out.wYaw.get.Data));

figure(2)
subplot(2,1,1)
plot(tt,Yaw_Deg);
grid minor;
xlabel('t[s]');
ylabel('\psi [deg]');
title('Yaw angle \psi');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt,wYaw_Deg);
grid minor;
xlabel('t[s]');
ylabel('\omega_\psi [deg/s]');
title('Yaw angular velocity \omega_\psi');
axis([0 t -inf inf]);

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
