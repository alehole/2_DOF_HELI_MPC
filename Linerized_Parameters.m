%operating points
t_op = (-10*pi)/180;    % pitch angle ( theta ) ( -10 degrees )
p_op = pi/2;            % yaw angle ( psi )     ( 90 degrees )
wt_op = 0;              % pitch angular velocity ( Omega theta )
wp_op = 0;              % yaw angular velocity ( Omega psi )

% Control inputs
V_mp_op = (K_yy* m_heli*g*cos(t_op)*l_cm  )/((K_yy*K_pp-K_yp*K_py));
V_my_op = (K_yp* V_mp_op)/K_yy ;
 
% System matrices
Ac = [0,0,1,0;
     0,0,0,1;
     (m_heli*g*sin(t_op)*l_cm)/(J_eqp+m_heli*l_cm*l_cm),0,-1*B_p/(J_eqp+m_heli*l_cm*l_cm),0;
     (2*m_heli*l_cm*l_cm*cos(t_op)*sin(t_op)*(K_yp*V_mp_op-K_yy*V_my_op)/((J_eqy+m_heli*...
     cos(t_op)*cos(t_op)*l_cm*l_cm))^2),0,0,-B_y/(J_eqy+m_heli*cos(t_op)*cos(t_op)*l_cm*l_cm)];

Bc = [0,0;
      0,0;
      K_pp/(J_eqp+m_heli*l_cm*l_cm), -K_py/(J_eqp+m_heli*l_cm*l_cm);
      K_yp/(J_eqy+m_heli*l_cm*l_cm*cos(t_op)*cos(t_op)),-K_yy/(J_eqy+m_heli*l_cm*l_cm*cos(t_op)*cos(t_op))];


Cc = [1,0,0,0;
      0,1,0,0];
