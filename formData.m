function Data = formData(n, data, I, InitialMean)
    Data = zeros(n, 1);
    Data(1,1) = 1;
    if I > n
        for j=2:n-4,
            Data(j,1) = data(I-j+2,1);
        end
        Amplitude = max(Data(2:n-4, 1))-mean(Data(2:n-4, 1));
        stdev = std(Data(2:n-3, 1));
        Data(n-3, 1) = mean(Data(2:n-4, 1));
        Data(n-2, 1) = zeroCrossing(Data(2:n-4, 1), InitialMean);
        Data(n-1, 1) = stdev*10;
        Data(n,1) = Amplitude*10;
    end
end