clear; close all; clc;
g=9.81;
m=1;
M=2;
l=1;
s1=-0.5+1i;
s2=conj(s1);
s_cinf=-5;

poles=[s1, s2, s_cinf, s_cinf];

A=[0, 0, 1, 0;
   0, 0, 0, 1;
   0, (3*m*g)/(4*M+m), 0, 0;
   0, ((M+m)*g)/(2*M/3+m)/l, 0, 0];

B=[0;
   0;
   1/(M+m/4);
   -1/(m+2*M/3)/l];
C = eye(4);     % vagy amit szeretnél mérni
D = zeros(4,1); % rendszerint nulla


sys = ss(A,B,C,D); 

K = acker(A, B, poles)