

g=9.81;
M=5;
m=0.3;
l=0.6;

%%
s1=-2+2i;
s2=conj(s1);
s_cinf=-10;

poles=[s1, s2, s_cinf, s_cinf];

A=[0, 0, 1, 0;
   0, 0, 0, 1;
   0, (3*m*g)/(4*M+m), 0, 0;
   0, (2*(M+m)*g)/(4*M+m)/l, 0, 0];

B=[0;
   0;
   4/(4*M+m);
   -4/(4*M*l+m*l)];
C = eye(4);     % vagy amit szeretnél mérni
D = zeros(4,1); % rendszerint nulla


q11=1;
q22=1000;
q33=1;
q44=500;

Q=[q11,0,0,0
    0,q22,0,0
    0,0,q33,0
    0,0,0,q44];
R=1;

sys = ss(A,B,C,D); 

%K = acker(A, B, poles);
K=lqr(A,B,Q,R)