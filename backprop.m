function [A1, A2] = backprop (flexed, alpha, A1, A2, Data)
% much math
    m = floor(size(A2, 2)/2); % not important. Just something I was trying and now dont want to delete
    x = eye(2*m);
    errorMatrix = ones(size(A2, 2), m);
    HiddenLayer = 1./(1+exp(-A1'*Data)); % compute hidden layer
    Hyp = 1./(1+exp(-A2'*[1;HiddenLayer])); % and hypothesis
    for ind = 1:m, % for our purposes m == 1 so nvm this
        errorMatrix(:, ind) = Hyp - x(:, ind+flexed*m);
    end
    error = errorMatrix.*errorMatrix;
    Error = sum(error);
    [i, j] = min(Error);
    dEdo = errorMatrix(:, j); %  partial derivatives
    dodnOut = (1-Hyp).*Hyp;
    dodnHid = (1-HiddenLayer).*HiddenLayer;
    UpdateA2 = -alpha*[1;HiddenLayer]*(dEdo.*dodnOut)'; % chain rule
    A2 = A2+UpdateA2; % update A2
    dsecondLayerdw = A2*(dodnOut.*dEdo);
    UpdateA1 = -alpha*Data*(dodnHid.*(dsecondLayerdw(2:end)))';
    A1 = A1+UpdateA1; % update A1
end