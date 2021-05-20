clear all; clc;warning('off');
% 以 sample2 数据为例，数据包间隔为0.05s
csi_trace = read_bf_file('TestData/4_19_mn2.dat');

for i = 1:1200
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi_size = size(csi);
    
    amplitude = abs(squeeze(csi(1,1,:)).');
    
    raw_csi(:,i) = amplitude;
end

bounds = [];count = 0;
i = 1;

for j = 1:1200
    varvalue(j) = var(raw_csi(16,1:j));
end

newvarvalue = [];

for j = 1:1200
    if j < 400
        if max(varvalue(i:j)) - min(varvalue(i:j)) > 1.5
            count = count + 1;
            bounds(count,1) = i;
            bounds(count,2) = j;
            i = j;
        end
    end
    
    if j > 400 && j <600
        if max(varvalue(i:j)) - min(varvalue(i:j)) > 0.5
            count = count + 1;
            bounds(count,1) = i;
            bounds(count,2) = j;
            i = j;
        end
    end
    
    if j > 600
        if max(varvalue(i:j)) - min(varvalue(i:j)) > 0.3
            count = count + 1;
            bounds(count,1) = i;
            bounds(count,2) = j;
            i = j;
        end
    end
    
end

plot(varvalue);ylim=get(gca,'Ylim');hold on;


for i = 1:count
    plot([bounds(i,2),bounds(i,2)],ylim);hold on;
end
