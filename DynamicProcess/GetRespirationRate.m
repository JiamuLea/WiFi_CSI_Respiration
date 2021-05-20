function [ respirationrate ] = GetRespirationRate(x,ts,interval)
%GETRESPIRATIONRATE �����ź� x ���� x �����÷�ֵ���ķ����������
%xΪ�����źţ�tsΪ��������

[pks,locs] = findpeaks(x);
count = size(pks,2);

for i = 1 : size(pks,2)
    for j = max(1,locs(i)-interval/ts) : min(size(x,2),locs(i)+interval/ts)
        if x(j) > pks(i)
            pks(i) = 0;
            locs(i) = NaN;
            count = count - 1;
            break;
        end
    end
end

plot(x'); hold on
plot(locs,pks,'sr');xlabel('ʱ��/0.05s');ylabel('����');

sum = 0;
for i = 2:size(pks,2)
    if isnan(locs(i))
        continue;
    end
    break;
end


for j = i+1:size(pks,2)
    if isnan(locs(j))
        locs(j) = locs(j-1);
        continue;
    end
    sum = sum + locs(j) - locs(j-1);
end

respirationrate = sum / count * ts;
end

