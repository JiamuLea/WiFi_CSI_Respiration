clear all; clc;warning('off');
% �� sample2 ����Ϊ�������ݰ����Ϊ0.05s
csi_trace = read_bf_file('TestData/4_19_sn1.dat');

for i = 1:1200
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi_size = size(csi);
    
    amplitude = abs(squeeze(csi(1,1,:)).');
    
    raw_csi(:,i) = amplitude;
end


plot(raw_csi(16,:)');
ylabel('����');
xlabel('ʱ�䣨0.05s��');
title('��ֹ״̬ԭʼCSI�ź�');
