res_csi1(:) = wden(res_csi(:),'heursure','s','one',3,'sym3');

res_csi2(:) = wden(res_csi(:),'sqtwolog','h','mln',5,'sym9');

% subplot(3,1,1);
% plot(time,raw_csi);
% 
% subplot(3,1,2);
% plot(time,res_csi1);
% 
% subplot(3,1,3);
plot(time,smooth(res_csi2));
