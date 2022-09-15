clc;
clear all;
close all;
Vm = 10;
Vc = 10;
Fc = 30;
Fm = 0.3;
Fs = 130;
t1 = 10;
t = 0:1/Fs:t1;
c = Vc*sin(2*pi*Fc*t);
m = Vm*sin(2*pi*Fm*t);
y = ammod(m,Fc,Fs);
subplot(5,1,1);
plot(t,m);
title('Modulating Signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');
subplot(5,1,2);
plot(t,c);
title('Carrier Signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');
subplot(5,1,3);
plot(t,y);
title('Modulated Signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');
Vd(1)=0;
for i=2:length(y)
 if y(i)>Vd(i-1)
 Vd(i)=y(i);
 else
 Vd(i)=Vd(i-1)-0.023*Vd(i-1);
 end
end
h=fir1(100,0.0125,'low');
foutputc=filter(h,1,Vd);
subplot(5,1,4);
plot(t,Vd);
title('Envelope detector output of modulating signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');
subplot(5,1,5);
plot(t,foutputc);
title('Demodulated signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');