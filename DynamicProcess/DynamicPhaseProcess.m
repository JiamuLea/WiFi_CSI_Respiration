%% ��ȡ���ݺ�Hampel�˲�
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
% xlabel('ʱ��/s');
% ylabel('��λ');

%% ����λ��
window_length = 0.5; % ȡ�������ڵ�ʱ����Ϊ0.5s
window_size = window_length / 0.05; % �������ڵĳ���Ϊ10
phase_difference = [];
for i = 1:990
    phase_difference(i) = res_csi(i + 10) - res_csi(i);
end
plot(phase_difference)

%% С���任
res_csi2(:) = wden(phase_difference(:),'sqtwolog','h','mln',5,'sym8');
res_csi3(:) = wden(res_csi(:),'sqtwolog','h','mln',5,'sym8');

% subplot(2,1,1);plot(res_csi2);title('��ֺ����λͼ');xlabel('ʱ��/0.05s');
% subplot(2,1,2);plot(res_csi3);title('ԭʼ��λͼ');xlabel('ʱ��/0.05s');
%% �Ƚ�ͼ
tmp = importdata('TestData/mn1.csv');
GyroX = tmp.data(:,5);
x = smooth(hampel(GyroX,4,3));
plot(res_csi2*2.5+5);
hold on;
plot(21:955,x*5);
xlabel('ʱ��/0.05s');
legend('wifi��֪','���ٴ�����');
