clc;clear all;warning('off');
csi_trace = read_bf_file('data/4_14_1.dat');

for i = 2001:5000
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    
    amplitude = db(abs(squeeze(csi(1,1,:)).'));
    raw_csi(:,i-2000) = amplitude;
end

for i = 1:30
    res_csi(i,:) = hampel(raw_csi(i,:),3,2);
    [y,j(i,:),xmedian,xsigma] = hampel(raw_csi(i,:),4,3);
end

time = 0.01:0.01:30;

plot(time,raw_csi);
hold on
for i = 1:30
    plot(time(find(j(i,:))),raw_csi(i,j(i,:)),'sr');
    hold on
end
xlabel('Ê±¼ä/s');
ylabel('Õñ·ù/(DB)');

