function [fft_out, freqs] = fft_signal(signal, fs)
    fft_out = abs(fft(signal));
    freqs = linspace(0,fs,length(fft_out));
end