function EMGclassifyLive

clc;
clear all;

a = arduino();
fid = fopen('last.txt', 'a+');

n = 10; % dimension of feature vector. 1 bias, 8 time series, 1 amplitude
n1 = 10; % dimension of hidden layer

Data = ones(n, 1);

A1 = rand(n, n1-1)/100-ones(n, n1-1)/200;
A2 = rand(n1, 2)/100-ones(n1, 2)/200;

alpha = .03; % learning rate

fprintf('relax\n');

for i=1:2999 % train 
    if mod(i, 200) == 0, % alternate between flexed and relaxed
        disp(A1); % display A1 and A2 to demonstrate convergence
        disp(A2);
        pause(0.5);
    end
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
    flexed = mod(floor(i/200),2); % correct answer
    Data = formDataArduino(n, Data, val, i); % formatting
    if i > n-2
        [A1, A2] = backprop(flexed, alpha, A1, A2, Data);
    end
end


plotted = [];
average = 1;
last5 = zeros(30, 1);

for i2 = 1:10000
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
    flex = predictArduino (n, A1, A2, Data, val, i2);
    if flex == 1,
        fprintf('Relaxed\n');
    elseif flex == 2 
        fprintf('Flexed\n');
    end
    for j1 = 1:29
        last5(j1) = last5(j1+1);
    end
    last5(30) = (flex-1)*2;
    average = sum(last5)/30;
    plotted = [plotted average];
    plot(plotted);
    drawnow;
end

