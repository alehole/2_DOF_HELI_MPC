%parameters of process

l_cm = 0.015;     %[m] Distance between the pivot point and the center of mass of helicopter
m_heli = 0.479;   %[kg] Total moving mass of the helicopter
J_eqp = 0.0172;   %[kg/m^2] Moment of inertia about the pitch axis
J_eqy = 0.0210;   %[kg/m^2] Moment of inertia about the yaw axis
g = 9.81;         %[m/s^2] Acceleration due to gravity on planet earth
 
K_pp = 0.0556;  %[Nm/V] Torque constant on pitch axis from pitch motor/propeller
K_yy = 0.21084; %[Nm/V] Torque constant on yaw axis from yaw motor/propeller
K_py = 0.005;   %[Nm/V] Torque constant on pitch axis from yaw motor/propeller
K_yp = 0.15;    %[Nm/V] Torque constant on yaw axis from pitch motor/propeller
B_p = 0.01;     %Damping friction factor about pitch axis
B_y = 0.08;     %Damping friction factor about yaw axis