%% 读取 csi_trace
clc;clear all;warning('off');
csi_trace = read_bf_file('TestData/4_19_sn1.dat');

%% 获取原始振幅率
for i = 1:1800
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    
    amplitude = abs(csi(1,1,:))./abs(csi(1,2,:));
   
    raw_csi_amplitude(:,i) = amplitude(16);
end

% plot(raw_csi_amplitude);

%% 对振幅率进行 Hampel 滤波
res_csi_amplitude(:) = hampel(raw_csi_amplitude(:),3,2);
[y,j(:),xmedian,xsigma] = hampel(raw_csi_amplitude(:),4,3);

time = 0.05:0.05:90;
% 
% plot(time,raw_csi_amplitude);
% hold on
% 
% plot(time(find(j)),raw_csi_amplitude(1,j),'sr');
% hold on
% 
% plot(time,res_csi_amplitude);
% xlabel('时间(s)');
% ylabel('振幅(DB)');

%% 对振幅率做小波变换
res_csi_amplitude(:) = wden(res_csi_amplitude(:),'sqtwolog','s','one',5,'sym7');

% plot(time,res_csi_amplitude(:));
% xlabel('时间(s)');
% ylabel('振幅');

%% 和ground truth对比图
time2 = 5.88:0.08:88.6;
plot(time,(res_csi_amplitude));
hold on;plot(time2,GyroX'*0.3+0.4);
xlabel('时间(1s)');
ylabel('幅度');
legend('WiFi感知','真实数据');

%% 功率谱分析
% [pows,freq] = analyse_power_spectrum(raw_csi_amplitude,20);
% plot(freq,pows);
% axis([0.75,1.75,-30,-23]);
% xlabel('频率(Hz)');
% title('平均功率谱');
