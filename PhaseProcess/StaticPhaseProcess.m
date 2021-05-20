%% 读取数据
warning('off');%clear all;
csi_trace = read_bf_file('TestData/4_19_sn1.dat');

%% Hampel滤波
for i = 1:1800
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    
    csi_size = size(csi);

    phase = angle(csi(1,1,16)-csi(1,2,16));
        
    raw_csi_phase(:,i) = phase;
end

time = 0.05:0.05:90;

res_csi_phase(:) = hampel(raw_csi_phase(:),3,2);
[y,j(:),xmedian,xsigma] = hampel(raw_csi_phase(:),4,3);

% plot(time,raw_csi);
% hold on
% 
% plot(time(find(j)),raw_csi(1,j),'sr');
% hold on
% 
% xlabel('时间/s');
% ylabel('相位');

%% 小波变换
res_csi_phase(:) = wden(res_csi_phase(:),'sqtwolog','h','mln',5,'sym7');
plot(hampel(res_csi_phase,3,2));