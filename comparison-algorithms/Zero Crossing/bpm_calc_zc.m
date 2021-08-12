function bpm = bpm_calc_zc(zero_crossings, timeWindow)
    bpm = (zero_crossings/2)*(60.0/timeWindow);
end