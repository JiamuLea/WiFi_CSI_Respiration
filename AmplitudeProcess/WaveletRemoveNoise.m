
for i = 1:30
    res_csi1(i,:) = wden(res_csi(i,:),'heursure','s','one',2,'sym3');
end

for i = 1:30
    res_csi2(i,:) = wden(res_csi(i,:),'sqtwolog','h','one',8,'sym7');
end

subplot(3,1,1);
plot(time,raw_csi(16,:));

subplot(3,1,2);
plot(time,res_csi1(16,:));

subplot(3,1,3);
plot(time,res_csi2(16,:));
