function [y, mu, sd] = sigmoid(x, mu, sd, func)
%SIGMOID Normalise data vector with a sigmoid (tanh--- default--- or logistic) function.
    if isrow(x)
        wasRow = 1;
        x = x';
    else
        wasRow = 0;
    end
    if nargin < 2 || isempty(mu)
        mu = nanmean(x, 1);
    end
    if nargin < 3 || isempty(sd)
        sd = nanstd(x, [], 1);
    end
    if nargin < 4 || isempty(func)
        func = 'tanh';
    end
    if sd == false % i.e. don't take SD from data
        sd == 1;
    end
    if isscalar(func) && func >= 0.5
        func = 'logistic';
    elseif isscalar(func) && func == 0
        func = 'tanh';
    end
        
    alreadyNaN = isnan(x);
    
    switch func
        case 'tanh'
            y = tanh((x - mu)./sd);
        case 'logistic'
        	y = 1./(1 + exp(-(x-mu)./sd));
        otherwise
            error('Not a valid normalisation function')
    end
    
    y(isnan(y) & ~alreadyNaN) = 0;
    if wasRow
        y = y';
    end
end

