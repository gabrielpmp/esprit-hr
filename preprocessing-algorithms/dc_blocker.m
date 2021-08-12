function signal_out = dc_blocker(signal, alpha)
    b=[1 -1];
    a = [1 -alpha];
    zi = signal(1);
    signal_out = filter(b,a,signal,zi);
end