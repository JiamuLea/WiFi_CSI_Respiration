for i = 1001:5000
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    
    amplitude = abs(csi(1,1,:))./abs(csi(1,2,:));
   
    raw_csi_amplitude(:,i-1000) = amplitude(16);
end

plot(raw_csi_amplitude)
