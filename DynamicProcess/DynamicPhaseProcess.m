%% 获取数据和Hampel滤波
clc;clear all;warning('off');
csi_trace = read_bf_file('TestData/4_19_mn1.dat');

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

% plot(time,raw_csi);
% hold on
% 
% plot(time(find(j)),raw_csi(1,j),'sr');
% hold on
% 
% xlabel('时间/s');
% ylabel('相位');

%% 求相位差
window_length = 0.5; % 取滑动窗口的时间间隔为0.5s
window_size = window_length / 0.05; % 滑动窗口的长度为10
phase_difference = [];
for i = 1:990
    phase_difference(i) = res_csi(i + 10) - res_csi(i);
end
plot(phase_difference)

%% 小波变换
res_csi2(:) = wden(phase_difference(:),'sqtwolog','h','mln',5,'sym8');
res_csi3(:) = wden(res_csi(:),'sqtwolog','h','mln',5,'sym8');

% subplot(2,1,1);plot(res_csi2);title('差分后的相位图');xlabel('时间/0.05s');
% subplot(2,1,2);plot(res_csi3);title('原始相位图');xlabel('时间/0.05s');
%% 比较图
tmp = importdata('TestData/mn1.csv');
GyroX = tmp.data(:,5);
x = smooth(hampel(GyroX,4,3));
plot(res_csi2*2.5+5);
hold on;
plot(21:955,x*5);
xlabel('时间/0.05s');
legend('wifi感知','加速传感器');
