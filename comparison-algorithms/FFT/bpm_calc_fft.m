function bpm = bpm_calc_fft(signal, freqs)
    interval = signal(1:fix(length(signal)/2));
    [M, I] = max(interval);
    bpm = freqs(I)*60.0;
end