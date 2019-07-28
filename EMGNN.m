function EMGNN

clear all;
a = arduino();
fid = fopen('EMGflexData.txt', 'w');
n=5;

A1 = rand(n, 5)/4;
A2 = rand(5, 2)/2;

Data = zeros(n, 1);

x = eye(2);

alpha = .1;
flexed = 1;

fprintf('relax muscle');

tic;
Complete = 0;

for i=1:2000
    if i>n
        if i<600 && floor(floor(i/50)/2)*2 == floor(i/50);
            if flexed == 2,
                fprintf('relax');
            end
            flexed = 1;
        elseif i<600
            if flexed == 1,
                fprintf('flex');
            end
            flexed = 2;
        else
            alpha = 0;
        end
        for j=1:n-1,
            Data(j) = Data(j+1);
        end
        val = readVoltage(a, 'A0');
        Data(n) = val;
        fprintf(fid, '%f\n', val);
        %scatter(index, val);
        %index = index + 1;
        %drawnow;
        %hold on;
        HiddenLayer = 1./(1+exp(-A1'*Data));
        Hyp = 1./(1+exp(-A2'*HiddenLayer));
        Error = Hyp - x(:, flexed);
        dEdo = Error;
        dodnOut = (1-Hyp).*Hyp;
        dodnHid = (1-HiddenLayer).*HiddenLayer;
        UpdateA2 = -alpha*HiddenLayer*(dEdo.*dodnOut)';
        A2 = A2+UpdateA2;
        UpdateA1 = -alpha*Data*(dodnHid.*(A2*(dodnOut.*dEdo)))';
        A1 = A1+UpdateA1;
        HidLayer = 1./(1+exp(-A1'*Data));
        TestHyp = 1./(1+exp(-A2'*HidLayer));
        [maxVal, maxIndex] = max(TestHyp);
%         if maxIndex == 1 && i > 600;
%             fprintf('Hand closed\n');
%         elseif i > 600;
%             fprintf('hand open\n');
%         end
        if i < 1300 && i > 600
            fprintf('keep relaxed\n');
        elseif i>600
            fprintf('keep flexed\n');
        end
    else
        Data(i) = readVoltage(a, 'A0');
    end
    dif = 0.07 - (toc - Complete);
    pause(dif);
    %dif = toc-Complete
    Complete = toc;
end
