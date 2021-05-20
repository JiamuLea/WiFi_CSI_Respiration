res_csi2 = res_csi2(16,:) - mean(res_csi2(16,:));
f = fftshift(fft(res_csi2));
size_f = size(f);
w = linspace(-10,10,length(res_csi2));

ff = f*100;

w = linspace(-10,10,length(ff));
plot(w,abs(ff));

Fs = 20;
wp = [0.3 0.6]*2*pi/Fs;
ws = [0.05 0.8]*2*pi/Fs;
Rp = 1; Rs = 20;
[N,Wn] = buttord(wp,ws,Rp,Rs,'s');
[bb,ab] = butter(N,Wn,'s');
W = 0:0.01:2;
[Hb,wb]=freqs(bb,ab,W);                
plot(wb/pi,20*log10(abs(Hb)),'b');

y = filter(bb,ab,res_csi);
plot(y');
xlabel('Ê±¼ä/(0.05s)');
ylabel('Õñ·ù');
