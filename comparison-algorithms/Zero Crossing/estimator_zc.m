function result = estimator_zc(raw_data, fs, timeWindow)
    signal_noart = remove_artifacts(raw_data);
    signal_nodc = dc_blocker(signal_noart, 0.95);
    fc = 4;
    [b,a] = butter(6,fc/(fs/2));
    signal_filt = filter(b,a,signal_nodc);
    filt_converg = floor(150*log10(fs));
    %plot(signal_filt(filt_converg:end))
    zc = calculate_zero_crossing(signal_filt(filt_converg:end), fs*timeWindow);
    result = bpm_calc_zc(zc, timeWindow);
end