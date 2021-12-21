clc
clear all
close all

n=(1:1000);
N=length(n)

x = randn(N,1);
d=filter([1 1.0 0.01],1,x)+1*rand(N,1);

%estimate using NLMS
beta = 1;
M=5; % filter order = 5
W=zeros(1,M+1);

y=zeros(1,N);
e=y;

%epoches
for k=M+1:1:N
    X=x(k:-1:k-M)
    y(k)= W*X;
    e(k)= d(k)-y(k);
    ab = X'*X+0.0001;
    W=W+beta/ab*e(k)*X';
end