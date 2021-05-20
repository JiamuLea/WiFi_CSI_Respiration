res_csi2 = res_csi2 - mean(res_csi);
f = fftshift(fft(res_csi2-mean(res_csi2)));
size_f = size(f);
w = linspace(-10,10,length(res_csi2));

ff = f*0.01;

w = linspace(-10,10,length(ff));
plot(w,abs(ff));

Fs = 100;
wp = [3 5]*2*pi/Fs;
ws = [2 6]*2*pi/Fs;
Rp = 1; Rs = 20;
[N,Wn] = buttord(wp,ws,Rp,Rs,'s');
[bb,ab] = butter(N,Wn,'s');
% W = 0:0.01:2;
% [Hb,wb]=freqs(bb,ab,W);                
% plot(wb/pi,20*log10(abs(Hb)),'b');

y = filter(bb,ab,res_csi);
% y = smooth(y);
% y(:) = wden(y,'heursure','s','one',3,'sym3');

plot(y);
xlabel('时间/(0.05s)');
ylabel('相位');

