
% Features, other than time series:
%0. Time series, including delays upto 'n'.
%1. Number of zero crossings, zero being the mean of a window in the time
%series
%2. Mean of a window.
%3. Variance, or some other measure of amplitude, maybe try max deviation from
% window mean

% Motions
%1. flexion
%2. extension
%3. pronation
%4. Supination

function EMGNN
clear all;
fid = fopen('EmgflexData.txt', 'r');
data = fscanf(fid, '%f');

n = 12;
n1 = 5;

A1 = rand(n, n1-1)/10-ones(n, n1-1)/20;
A2 = rand(n1, 2)/10-ones(n1, 2)/20;

True = 0
False = 0;
FalsePositive = 0;
FalseNegative = 0;

InitialMean = 1.62;
flexed = 0;
alpha = .6;

for ind = 1:20
for i=1:400
    I=i;
    prev = flexed;
    flexed = mod(floor(I/50),2);
    Data = formData(n, data, I, InitialMean);
    [A1, A2] = backprop(flexed, alpha, A1, A2, Data);
end
end


disp(A1);
disp(A2);
flex = 0;
for i2 = 600:length(data)
    flex = predict (n, A1, A2, data, i2, InitialMean) - 1;
    if flex == 1,
        if i2 < 1300,
            FalsePositive = FalsePositive + 1;
        else
            True = True + 1;
        end
    else 
        if i2 < 1300,
            False = False + 1;
        else
            FalseNegative = FalseNegative + 1;
        end
    end
end

fprintf('Correctly Positive: %d\n', True);
fprintf('Correct Negative: %d\n', False);
fprintf('False Positive: %d\n', FalsePositive);
fprintf('False Negative: %d\n', FalseNegative);
