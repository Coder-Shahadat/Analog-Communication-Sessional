clc;
close all;
clear all;
Ac=input('Enter carrier signal amplitude = ');
Am=input('Enter message signal amplitude = '); % m=Am/Ac,m>=0 and m<=1 otherwise we loss some of message data
fc=input('Enter carrier frequency = ');
fm=input('Enter message frequency = '); % fm<fc
t=input('Enter time period = ');
t1 = (0:.001:t);
sm=Am*sin(2*pi*fm*t1); % message signal
sc=Ac*sin(2*pi*fc*t1); % carrier signal
m=Am/Ac;
eq=Ac.*(1+m.*sin(2*pi*fm*t1)).*(sin(2*pi*fc*t1));  % Modulated Signal
subplot(3,1,1);
plot(t1,sm);
xlabel('Time(sec)');
ylabel('Amplitude(V)');
title('Message signal');
subplot(3,1,2);
plot(t1,sc);
xlabel('Time(sec)');
ylabel('Amplitude(V)');
title('Carrier signal');
subplot(3,1,3);
plot(t1,eq);
xlabel('Time(sec)');
ylabel('Amplitude(V)');
title('Modulated signal');
