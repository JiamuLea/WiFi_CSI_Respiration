respiration = GyroX;

[pks,locs] = findpeaks(respiration);

[x1, x2] = size(pks);
count = 0; sum = 0;

for i = 2:x2
    count = count + 1;
    sum = sum + locs(i) - locs(i-1);
end

plot(respiration'); hold on
plot(locs,pks,'sr');
xlabel('Ê±¼ä/(0.01s)');
ylabel('Õñ·ù');