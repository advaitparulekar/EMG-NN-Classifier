function flex = predict (n, A1, A2, data, start, InitialMean)
    Data = formData(n, data, start, InitialMean);
    HidLayer = 1./(1+exp(-A1'*Data));
    TestHyp = 1./(1+exp(-A2'*[1;HidLayer]));
    [maxVal, maxIndex] = max(TestHyp);
    %disp(TestHyp');
    flex = maxIndex;
    disp(flex);
end