% EE254 Monson Hayes C9_2b
% Adaptive System Identification
% by Mahekkumar Pavthawala
clc
clear all
close all
n=(1:1000);
N=length(n);

x=randn(N,1); %input
d=filter([1 1.0 0.01],1,x); %reference

%estimate using LMS
mu= 0.02;
M=3; %order of the filter=
W = zeros(1,M+1);

y = zeros(1,N);
e=y;

for k=M+1:1:N
    X=x(k:-1:k-M)
    y(k)=W*X
    e(k)=d(k)-y(k);
    W=W+2*mu*e(k)*X';
end