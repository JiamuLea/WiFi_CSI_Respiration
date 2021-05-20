window_length = 0.5; % 取滑动窗口的时间间隔为0.5s
window_size = window_length / 0.05; % 滑动窗口的长度为10
phase_difference = [];
for i = 1:990
    phase_difference(i) = res_csi2(i + 10) - res_csi2(i);
end
plot(phase_difference)