dt = 0.1;
t = (length(out.Pitch.get.Data)-1)*dt;
tt = 0:dt:t;

% Pitch
Pitch_Result = out.Pitch.get.Data(:);
Pitch_Deg = Pitch_Result(1:length(out.Pitch.get.Data));
wPitch_Result = out.wPitch.get.Data(:);
wPitch_Deg = wPitch_Result(1:length(out.wPitch.get.Data));

% Pitch Kalman Estimate
%Pitch_Kalman_Result = out.PitchEst.get.Data(:);
%Pitch_Deg_Kalman = Pitch_Kalman_Result(1:length(out.PitchEst.get.Data));
wPitch_Kalman_Result = out.wPitchEst.get.Data(:);
wPitch_Kalman_Deg = wPitch_Kalman_Result(1:length(out.wPitchEst.get.Data));


figure(1)
subplot(2,1,1)
%plot(tt,Pitch_Deg, tt, Pitch_Deg_Kalman);
plot(tt,Pitch_Deg)%, tt, Pitch_Deg_Kalman);
grid minor;
xlabel('t[s]');
ylabel('[deg]');
title('Pitch angle \theta');
legend('\theta', '\theta estimate');
yline(-10,'-','\theta_{op}','HandleVisibility','off');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt,wPitch_Deg,tt, wPitch_Kalman_Deg );
grid minor;
xlabel('t[s]');
ylabel('[deg/s]');
title('Pitch angular velocity \omega_\theta');
legend('\omega_\theta', '\omega_\theta estimate');
axis([0 t -inf inf]);

% Yaw
Yaw_Result = out.Yaw.get.Data(:);
Yaw_Deg = Yaw_Result(1:length(out.Yaw.get.Data));
wYaw_Result = out.wYaw.get.Data(:);
wYaw_Deg = wYaw_Result(1:length(out.wYaw.get.Data));
% Yaw Kalman Estimate
%Yaw_Kalman_Result = out.YawEst.get.Data(:);
%Yaw_Deg_Kalman = Yaw_Kalman_Result(1:length(out.YawEst.get.Data));
wYaw_Kalman_Result = out.wYawEst.get.Data(:);
wYaw_Kalman_Deg = wYaw_Kalman_Result(1:length(out.wYawEst.get.Data));

figure(2)
subplot(2,1,1)
%plot(tt,Yaw_Deg, tt, Yaw_Deg_Kalman);
plot(tt,Yaw_Deg)%, tt, Yaw_Deg_Kalman);
grid minor;
xlabel('t[s]');
ylabel('[deg]');
title('Yaw angle \psi');
legend('\psi', '\psi estimate');
yline(90,'-','\psi_{op}','HandleVisibility','off');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt,wYaw_Deg, tt , wYaw_Kalman_Deg);
grid minor;
xlabel('t[s]');
ylabel('[deg/s]');
title('Yaw angular velocity \omega_\psi');
legend('\omega_\psi', ' \omega_\psi estimate');
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


%% Task 4 is to estiamte omegas only
figure(4)
subplot(2,1,1)
plot(tt,Pitch_Deg);
grid minor;
xlabel('t[s]');
ylabel('[deg]');
title('Pitch angle \theta');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt, wPitch_Kalman_Deg);
grid minor;
xlabel('t[s]');
ylabel('[deg/s]');
title('Pitch angular velocity \omega_\theta Kalman estimate');
axis([0 t -inf inf]);

figure(5)
subplot(2,1,1)
plot(tt, Yaw_Deg);
grid minor;
xlabel('t[s]');
ylabel('[deg]');
title('Yaw angle \psi');
axis([0 t -inf inf]);

subplot(2,1,2)
plot(tt , wYaw_Kalman_Deg);
grid minor;
xlabel('t[s]');
ylabel('[deg/s]');
title('Yaw angular velocity \omega_\psi Kalman estimate');
axis([0 t -inf inf]);

