function numZeroCrossing = zeroCrossing(Data, initialMean)
numZeroCrossing = 0;
for i=2:length(Data),
    if abs(Data(i)-initialMean) < abs(Data(i)-Data(i-1));
        numZeroCrossing = numZeroCrossing + 1;
    end
end
end