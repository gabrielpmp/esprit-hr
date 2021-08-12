function result = estimator_esprit(raw_data, fs, timeWindow)
    signal_noart = remove_artifacts(raw_data);
    signal_nodc = dc_blocker(signal_noart, 0.95);
    fc = 4;
    [b,a] = butter(6,fc/(fs/2));
    signal_filt = filter(b,a,signal_nodc);
    filt_converg = floor(150*log10(fs));
    %plot(signal_filt(filt_converg:(timeWindow*fs)+filt_converg))
    [~, R] = corrmtx(signal_filt(filt_converg:end),floor((timeWindow*fs)/2),'cov');
    if isempty(estFreqEsprit(R, fs))
    	result = 0;
    else
        result = estFreqEsprit(R, fs)*60;
    end 
end