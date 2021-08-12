files = dir('*.csv');
timeWindows = [1 2 3 4 5 6 7 8 9 10];

for time = 1:length(timeWindows)
    filename = strcat('results/time_window_',num2str(timeWindows(time)),'s','.csv');
    sz = [length(files) 7];
    varTypes = {'string','cell','cell','cell','cell','cell','cell'};
    Headers = {'file';'fs';'esprit';'fft';'corr';'zc';'peak'};
    T = table('Size',sz,'VariableTypes',varTypes,'VariableNames',Headers);
    i = 0;

    for file = files'
        i = i+1;
        data = csvread(file.name, 1, 0);
        ir = data(:,1);        
        T{i,:} = { file.name, 100, ...
                   estimator_esprit(ir, 50, timeWindows(time)), ...
                   estimator_fft(ir, 50, timeWindows(time)), ...
                   estimator_corr(ir, 50, timeWindows(time)), ...
                   estimator_zc(ir, 50, timeWindows(time)), ...
                   estimator_pk(ir, 50, timeWindows(time))
                  };
    end

    writetable(T,filename,'Delimiter',',','QuoteStrings',true)

end