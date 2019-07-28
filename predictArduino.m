function flex = predictArduino (n, A1, A2, Data, val, i2)
    Data = formDataArduino(n, Data, val, i2);
    flex = 0;
    if i2>n-2
        HidLayer = 1./(1+exp(-A1'*Data)); % run numbers with hypothesized A1 and A2
        TestHyp = 1./(1+exp(-A2'*[1;HidLayer]));
        [maxVal, maxIndex] = max(TestHyp); % we predict whatever index has maximum value
        flex = maxIndex;
    end
end