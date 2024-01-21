G = eye(4);      % n states
H = zeros(2,4);  % n inputs, n states

plant = ss(Ac,[Bc,G],Cc,0);  %D = 0 since it is not present
Q = diag([5e1,5e1,5e1,5e1]); %process noise W
R = diag([10,10]);         %measurement noise V

%note: If you trust your sensors, you can put relatively less R. If you do
%not trust your model, you can put relatively more Q.
%calculate the kalman gain L
[KalmEst,L,P,M] = kalman(plant,Q,R);