function [y, mu, sd] = robustSigmoid(x, mu, sd, func)
%ROBUSTSIGMOID Normalise data vector with a sigmoid (tanh--- default--- or logistic) function.
% Instead of the mean and standard deviation for offset and scale
% parameters, robustSigmoid uses the median and interquartile range 
% (ala BF_NormalizeMatrix with 'robustSigmoid').
    if isrow(x)
        wasRow = 1;
        x = x';
    else
        wasRow = 0;
    end
    if nargin < 2 || isempty(mu)
        mu = nanmedian(x, 1);
    end
    if nargin < 3 || isempty(sd)
        sd = iqr(x, 1);
        sd(sd == 0) = std(x(:, sd == 0), [], 1); % Eh
    end
    if nargin < 4 || isempty(func)
        func = 'tanh';
    end
    if isscalar(sd) && sd == false % i.e. don't take SD from data
        sd = 1;
    end
    if isscalar(func) && func >= 0.5
        func = 'logistic';
    elseif isscalar(func) && func == 0
        func = 'tanh';
    end
    if isscalar(sd)
        sd = repmat(sd, 1, size(x, 2));
    end
        
    alreadyNaN = isnan(x);
    
    constantIdxs = ~range(x);
    mu(constantIdxs) = 0;
    sd(constantIdxs) = inf; % So all in this column will have the centre value of the normalisation function
    
%     iqr0Idxs = ~sd;
%     sd(iqr0Idxs) = nanstd(x(:, iqr0Idxs), [], 1);
%     mu(iqr0Idxs) = nanmean(x(:, iqr0Idxs), 1); % If iqr is 0, stick with usual offset and scale
        
    [y, mu, sd] = sigmoid(x, mu, sd./1.35, func); 
    % Divide iqr by 1.35 so that for normally distributed data this scale is
    % the same as the SD
    
    y(isnan(y) & ~alreadyNaN) = 0;
    if wasRow
        y = y';
    end
end
