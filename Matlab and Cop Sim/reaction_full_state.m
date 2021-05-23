clc, clear all, close all;

% Motor parameters (from vendor or references)
R=4.172;
km = 0.00775;
Umax = 13;

% Inertial wheel model
g = 9.81;                           % Gravitational acceleration
mgl = 0.12597;
mbg = mgl;
d11 = 0.0014636;
d12 = 0.0000076;
d21 = d12;
d22 = d21;

J = (d11*d22-d12*d21)/d12;
D = [d11 d12; d21 d22];
Di = inv(D);
di11 = Di(1,1);
di12 = Di(1,2);
di21 = Di(2,1);
di22 = Di(2,2);

% Linear approximate model of IWP
A = [ 0 1 0; di11*mbg 0 0; di21*mbg 0 0];
B = [0; di12*km/R; di22*km/R];

%System parameters 
C = [1 0 0; 0 1 0; 0 0 1];

D =[0;
    0;
    0];


% Controllability for making sure of the application of 
% full-state feedback
disp('Is the system controllable?');
Pc = ctrb(A,B);
if rank(Pc) == size(Pc)
    disp('Yes.');
else
    disp('No.');
end

% Desired closed-loop eigenvalues (from requirements)
s1 = -9.27 + 20.6i;
s2 = -9.27 - 20.6i;
s3 = -0.719;
Vp = [ s1, s2, s3];
K = place(A, B, Vp);

% Verify closed-loop eigenvalues of A_new or A_cl
Vp_ = eig(A-B*K);

sys = ss(A,B,C,D)





