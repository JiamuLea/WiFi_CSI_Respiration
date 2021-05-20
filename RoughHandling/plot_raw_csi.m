clear all; clc;warning('off');
% 以 sample2 数据为例，数据包间隔为0.05s
csi_trace = read_bf_file('TestData/4_19_sn1.dat');

for i = 1:1200
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi_size = size(csi);
    
    amplitude = abs(squeeze(csi(1,1,:)).');
    
    raw_csi(:,i) = amplitude;
end


plot(raw_csi(16,:)');
ylabel('幅度');
xlabel('时间（0.05s）');
title('静止状态原始CSI信号');
