% EE254 Monson Hayes C9_2c
% System Identification

clc;
clear all;
close all;

n=(1:1000);
N=length(n);

x=randn(N,1); %input
d=filter([1 1.0 0.01],1,x); %reference

%estimate using LMS
beta = 0.1;
M=4; %order of the filter=4
W = zeros(1,M+1);

y = zeros(1,N);
e=y;

for k=M+1:1:N
    X=x(k:-1:k-M)
    y(k)= W*X;
    e(k)= d(k)-y(k);
    ab = X'*X+0.0001;
    W=W+beta/ab*e(k)*X';
end