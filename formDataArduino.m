function Data = formDataArduino(n, Data, val, i2)
if i2 <= n-2
    Data(i2+1,1) = val;
end
if i2 > n-1
    Data(1,1) = 1; % bias
    for j=2:n-2, % move previous data back
        Data(j,1) = Data(j+1,1);
    end
    Data(n-1,1) = val; % new value in the last place
    Amplitude = max(Data(2:n-1,1))-mean(Data(2:n-1,1));
    Data(n,1) = Amplitude*10;
end
end