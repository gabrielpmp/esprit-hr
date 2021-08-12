function correlation = calculate_correlation(signal)
    correlation = xcorr(signal);
    %plot(correlation)
end