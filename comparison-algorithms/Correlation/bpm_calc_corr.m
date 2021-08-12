function bpm = bpm_calc_corr(corr, fs)
    [~,locs]=findpeaks(corr,'MinPeakDistance',fs/3);
    %findpeaks(corr,'MinPeakDistance',fs/3)
    bpm = mean(fs./diff(locs))*60.0;
end