respiration = res_csi2;

plot(respiration'); hold on

[pks,locs] = findpeaks(respiration);

[x1, x2] = size(pks);
count = 0; sum = 0;

for i = 2:x2
    if pks(1,i) < 0.043
        continue;
    end
    count = count + 1;
    sum = sum + locs(1,i) - locs(1,i-1);
end

plot(locs,pks,'sr');
