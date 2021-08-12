function result = estimator_fft(raw_data, fs, timeWindow)
    signal_noart = remove_artifacts(raw_data);
    signal_nodc = dc_blocker(signal_noart, 0.95);
    fc = 4;
    [b,a] = butter(6,fc/(fs/2));
    signal_filt = filter(b,a,signal_nodc);
    filt_converg = floor(150*log10(fs));
    %plot(signal_filt(filt_converg:(timeWindow*fs)+filt_converg))
    signal_zeros = [signal_filt(filt_converg:(timeWindow*fs)+filt_converg);zeros(1000,1)];
    [fft_data, freqs_data] = fft_signal(signal_zeros, fs);
    %plot(freqs_data, fft_data)
    result = bpm_calc_fft(fft_data, freqs_data);
end