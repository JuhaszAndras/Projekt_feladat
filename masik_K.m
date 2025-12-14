

g=9.81;
M=5;
m=0.3;
l=0.6;
J=1;

%%
s1=-2+2i;
s2=conj(s1);
s_cinf=-10;

poles=[s1, s2, s_cinf, s_cinf];

Jm=M*m*l^2 + J*m + J*M

A=[0, 0, 1, 0;
   0, 0, 0, 1;
   0, -g*l^2*m^2/Jm, 0, 0;
   0, l*m*g*(M+m)/Jm, 0, 0]

B=[0;
   0;
   (l^2*m+J)/Jm;
   -l*m/Jm]

C = eye(4)
D = zeros(4,1)



q11=10;
q22=10;
q33=10;
q44=50;

Q=[q11,0,0,0
    0,q22,0,0
    0,0,q33,0
    0,0,0,q44];
R=1;

sys = ss(A,B,C,D); 

%K = acker(A, B, poles);
K0=lqr(A,B,Q,R)