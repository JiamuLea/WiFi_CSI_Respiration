res_csi_amplitude1(:) = wden(res_csi_amplitude(:),'heursure','s','one',2,'sym3');

res_csi_amplitude2(:) = wden(res_csi_amplitude(:),'sqtwolog','h','one',8,'sym7');

subplot(3,1,1);
plot(time,raw_csi_amplitude(:));

subplot(3,1,2);
plot(time,res_csi_amplitude1(:));

subplot(3,1,3);
plot(time,res_csi_amplitude2(:));
