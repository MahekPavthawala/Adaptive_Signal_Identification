%System Identification with LMS Filter Algorithm
% by Mahekkumar Mayankkumar Pavthawala
% Citation : MathWorks
clc;
clear all;
close all;

filt = dsp.FIRFilter;
filt.Numerator = fircband(12,[0 0.4 0.5 1],[1 1 0 0],[1 0.2],... 
{'w' 'c'});
x = 0.1*randn(250,1);
n = 0.01*randn(250,1);
d = filt(x) + n;
mu = 0.8;
lms = dsp.LMSFilter(13,'StepSize',mu)
[y,e,w] = lms(x,d);

figure(1);
plot(1:250, [d,y,e]);
title('System Identification of an FIR filter')
legend('Desired','Output','Error')
xlabel('Time index')
ylabel('Signal value')

figure(2);
subplot(2,2,1)
stem([(filt.Numerator).' w])
title('System Identification by Adaptive LMS Algorithm')
legend('Actual filter weights','Estimated filter weights',...
       'Location','NorthEast')

subplot(2,2,2)
mu = 0.2;
lms = dsp.LMSFilter(13,'StepSize',mu);
[~,~,w] = lms(x,d);
stem([(filt.Numerator).' w])
title('System Identification by Adaptive LMS Algorithm')
legend('Actual filter weights','Estimated filter weights',...
       'Location','NorthEast')

release(filt);
x = 0.1*randn(1000,1);
n = 0.01*randn(1000,1);
d = filt(x) + n;
[y,e,w] = lms(x,d);
subplot(2,2,3)
stem([(filt.Numerator).' w])
title('System Identification by Adaptive LMS Algorithm')
legend('Actual filter weights','Estimated filter weights',...
       'Location','NorthEast')

release(filt);
n = 0.01*randn(1000,1);
for index = 1:4
  x = 0.1*randn(1000,1);
  d = filt(x) + n;
  [y,e,w] = lms(x,d);
end
subplot(2,2,4)
stem([(filt.Numerator).' w])
title('System Identification by Adaptive LMS Algorithm')
legend('Actual filter weights','Estimated filter weights',...
       'Location','NorthEast')
% 
% plot(1:1000, [d,y,e])
% title('System Identification of an FIR filter')
% legend('Desired','Output','Error')
% xlabel('Time index')
% ylabel('Signal value')