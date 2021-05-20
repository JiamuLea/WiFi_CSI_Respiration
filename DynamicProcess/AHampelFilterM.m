res_csi_amplitude(:) = hampel(raw_csi_amplitude(:),3,2);
[y,j(:),xmedian,xsigma] = hampel(raw_csi_amplitude(:),4,3);


time = 0.01:0.01:40;

plot(time,raw_csi_amplitude);
hold on

plot(time(find(j)),raw_csi_amplitude(1,j),'sr');
hold on

xlabel('Ê±¼ä/s');
ylabel('Õñ·ù/(DB)');

