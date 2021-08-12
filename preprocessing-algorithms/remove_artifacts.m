function signal_noart = remove_artifacts(signal)
    d = [0; diff(signal)];
    isValid = ~logical(abs( d ) > 100);
    signalCut = signal;
    signalCut(~isValid) = NaN;
    signalCut(isnan(signalCut(:))) = [];
    indices = abs(signalCut)<100;
    signalCut(indices) = [];
    signal_noart = signalCut;
end