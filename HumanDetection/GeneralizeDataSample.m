clear all; clc;warning('off');
% 以 sample2 数据为例，数据包间隔为0.05s
%% 环境内有人时的特征样本
csi_trace = read_bf_file('TestData/4_19_mn1.dat');

for i = 1:1200
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi_size = size(csi);
    
    amplitude = abs(squeeze(csi(1,1,:)).');
    
    raw_csi(i) = amplitude(16);
end
window_size = 100;

for j = 1:100:1101
    
    for i = 1:100
       tmp(i,:) = raw_csi(j:j+99);
    end
    
    C = cov(tmp);
    e = eig(C);
    sort_e = sort(e);
    DataSample(floor(j/100)+1,1) = sort_e(100);
    DataSample(floor(j/100)+1,2) = sort_e(99);
end

%% 环境内无人时的特征样本
csi_trace2 = read_bf_file('TestData/4_19_sno1.dat');

raw_csi = [];res_csi = [];

for i = 1:800
    csi_entry = csi_trace2{i};
    csi = get_scaled_csi(csi_entry);
    csi_size = size(csi);
    
    amplitude = abs(squeeze(csi(1,1,:)).');
    
    raw_csi(i) = amplitude(16);
end

% window_size = 100;
% raw_csi(:) = hampel(raw_csi(:),3,2);
% res_csi = smooth(raw_csi(:));
% res_csi(:) = wden(raw_csi(:),'sqtwolog','h','one',6,'sym2');

for j = 1:100:701
    
    for i = 1:100
       tmp(i,:) = raw_csi(j:j+99);
    end
    
    C2 = cov(tmp);
    e2 = eig(C2);
    sort_e2 = sort(e2);
    DataSample2(floor(j/100)+1,1) = sort_e2(100);
    DataSample2(floor(j/100)+1,2) = sort_e2(99);
end
% plot(res_csi);
%% 特征样本散点图的绘制
plot(DataSample(:,1).*1e26,DataSample(:,2).*1e42,'*');
hold on;
plot(DataSample2(:,1).*1e26,DataSample2(:,2).*1e42,'r*');
xlabel('Feature-X');
ylabel('Feature-Y');

