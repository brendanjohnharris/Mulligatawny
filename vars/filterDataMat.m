function [X, idxs] = filterDataMat(X, dim, NaNs, consts)
%FILTERDATAMAT 
% dim:  dimension to FILTER (e.g. 1 will remove entire rows)
% NaNs: Remove dims with any NaN values?
% consts: Remove dims with all constants?

    if nargin < 2 || isempty(dim)
        dim = 2;
    end
    if nargin < 3 || isempty(NaNs)
        NaNs = 1;
    end
    if nargin < 4 || isempty(consts)
        consts = 1;
    end
    if dim == 1
        idxs = true(size(X, 1), 1);
        for i = 1:size(X, 1)
            idxs(i) = ~((range(X(i, :)) == 0) && consts);
            idxs(i) = idxs(i) && ~(any(isnan(X(i, :))) && NaNs);
        end
        X = X(idxs, :);
    elseif dim == 2
        idxs = true(1, size(X, 2));
        for i = 1:size(X, 2)
            idxs(i) = ~((range(X(:, i)) == 0) && consts);
            idxs(i) = idxs(i) && ~(any(isnan(X(:, i))) && NaNs);
        end
        X = X(:, idxs);
    else
        warning('Can''t handle that many dimensions!')
    end
    
    %function eh = isconstant(x)
    %    eh = all(nanmean(x)==x);
        %eh = eh || (std(x) < 3.*eps);
    %end
end

