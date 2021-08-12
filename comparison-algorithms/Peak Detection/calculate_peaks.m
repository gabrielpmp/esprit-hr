function num_peaks = calculate_peaks(signal, samples, fs)
    pks = findpeaks(signal(1:samples),'MinPeakDistance',fs/3);
    %findpeaks(signal(1:samples),'MinPeakDistance',fs/3)
    num_peaks = length(pks);
end