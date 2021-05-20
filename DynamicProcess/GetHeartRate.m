function [ heartrate ] = GetHeartRate( x,fs )
%GetHeartRate 函数用来从信号中计算心率，计算方法为功率谱分析+峰值点检测+聚类
%x为待测信号，fs为采样频率
[pows,freq] = analyse_power_spectrum(x,fs);
[pks,locs] = findpeaks(pows);
for i = 1:size(freq,2)
    if freq(i) >= 1
        left = i;
        break;
    end
end
for i = 1:size(freq,2)
    if freq(i) >= 1.6
        right = i;
        break;
    end
end

sum = 0;count = 0;
for i = 1:size(locs,2)
    if locs(i) > left && locs(i) < right && pks(i) > 4
        sum = sum + freq(locs(i));
        count = count + 1;
    end
end
heartrate = sum / count;
end

