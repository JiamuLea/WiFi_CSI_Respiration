window_length = 0.5; % ȡ�������ڵ�ʱ����Ϊ0.5s
window_size = window_length / 0.05; % �������ڵĳ���Ϊ10
phase_difference = [];
for i = 1:990
    phase_difference(i) = res_csi2(i + 10) - res_csi2(i);
end
plot(phase_difference)