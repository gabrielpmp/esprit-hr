function zero_crossings = calculate_zero_crossing(signal, samples)
    zcd = dsp.ZeroCrossingDetector;
    zero_crossings = zcd(signal(1:samples));
end