clc;clear all;warning('off');
csi_trace = read_bf_file('data/4_14_m5.dat');

for i = 1:1000
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    
    csi_size = size(csi);

    phase = angle(csi(1,1,16)-csi(1,2,16));
        
    raw_csi(:,i) = phase;
end

time = [0.05:0.05:50];

res_csi(:) = hampel(raw_csi(:),3,2);
[y,j(:),xmedian,xsigma] = hampel(raw_csi(:),4,3);

plot(time,raw_csi);
hold on

plot(time(find(j)),raw_csi(1,j),'sr');
hold on

xlabel('时间/s');
ylabel('相位');

