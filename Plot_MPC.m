


% References
Pitch_ref = out.Pitch_SP.get.Data(:,2);
Yaw_ref = out.Yaw_SP.get.Data(:,2);

dt = 0.1;
t = (length(Yaw_ref)-1)*dt;
tt = 0:dt:t;

% Control voltages
Vmp_Result = out.V_mp.get.Data(:);
Vmy_Result = out.V_my.get.Data(:);

figure(1)
plot(tt,Vmp_Result, tt,Vmy_Result);
grid minor;
xlabel('t[s]');
ylabel('V');
title('Control voltages');
legend('Vmp', 'Vmy');
axis([0 t -inf inf]);

% Pitch
Pitch_Result = out.Pitch.get.Data(:);
Pitch_Deg = Pitch_Result(1:length(out.Pitch.get.Data));
wPitch_Result = out.wPitch.get.Data(:);
wPitch_Deg = wPitch_Result(1:length(out.wPitch.get.Data));

figure(2)
subplot(2,1,1)
plot(tt,Pitch_Deg, tt, Pitch_ref );
grid minor;
xlabel('t[s]');
ylabel('\theta [deg]');
title('Pitch angle \theta');
legend('\theta', '\theta SP');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt,wPitch_Deg);
grid minor;
xlabel('t[s]');
ylabel('\omega_\theta [deg/s]');
title('Pitch angular velocity \omega_\theta');
axis([0 t -inf inf]);

% Yaw
Yaw_Result = out.yaw.get.Data(:);
Yaw_Deg = Yaw_Result(1:length(out.yaw.get.Data));
wYaw_Result = out.wYaw.get.Data(:);
wYaw_Deg = wYaw_Result(1:length(out.wYaw.get.Data));

figure(3)
subplot(2,1,1)
plot(tt,Yaw_Deg, tt, Yaw_ref );
grid minor;
xlabel('t[s]');
ylabel('\psi [deg]');
title('Yaw angle \psi');
legend('\psi', '\psi SP');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt,wYaw_Deg);
grid minor;
xlabel('t[s]');
ylabel('\omega_\psi [deg/s]');
title('Yaw angular velocity \omega_\psi');
axis([0 t -inf inf]);


