function [ heartrate ] = GetHeartRate( x,fs )
%GetHeartRate �����������ź��м������ʣ����㷽��Ϊ�����׷���+��ֵ����+����
%xΪ�����źţ�fsΪ����Ƶ��
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

