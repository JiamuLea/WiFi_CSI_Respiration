%% ��ȡ csi_trace
clc;clear all;warning('off');
csi_trace = read_bf_file('TestData/4_19_sn1.dat');

%% ��ȡԭʼ�����
for i = 1:1800
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    
    amplitude = abs(csi(1,1,:))./abs(csi(1,2,:));
   
    raw_csi_amplitude(:,i) = amplitude(16);
end

% plot(raw_csi_amplitude);

%% ������ʽ��� Hampel �˲�
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
% xlabel('ʱ��(s)');
% ylabel('���(DB)');

%% ���������С���任
res_csi_amplitude(:) = wden(res_csi_amplitude(:),'sqtwolog','s','one',5,'sym7');

% plot(time,res_csi_amplitude(:));
% xlabel('ʱ��(s)');
% ylabel('���');

%% ��ground truth�Ա�ͼ
time2 = 5.88:0.08:88.6;
plot(time,(res_csi_amplitude));
hold on;plot(time2,GyroX'*0.3+0.4);
xlabel('ʱ��(1s)');
ylabel('����');
legend('WiFi��֪','��ʵ����');

%% �����׷���
% [pows,freq] = analyse_power_spectrum(raw_csi_amplitude,20);
% plot(freq,pows);
% axis([0.75,1.75,-30,-23]);
% xlabel('Ƶ��(Hz)');
% title('ƽ��������');
