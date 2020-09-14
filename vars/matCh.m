function [matA, idxA, matB, idxB] = matCh(matA, idxA, matB, idxB, nanFlag)
%MATCH Reorder a matrix via indices so that it matches the ordering of a
% second matrix (in columns). A simple thing, but easy to mess up.
%   matA: The target matrix; columns are elements idxA
%   idxA:       The indices (numeric, cell, categorical) for the rows of matA
%   matB:       The source matrix
%   idxB:       The indices of matB
%   nanFlag:    Whether to remove the columns of matA or matB not in matB
%               or matA (false) or and dummy nan values to matA (true).
    if nargin < 4 || isempty(idxB)
        idxB = matB;
        matB = [];
    end
    if nargin < 5 || isempty(nanFlag)
        nanFlag = false; % Remove columns, don't pad
    end
    if size(matA, 2) == 1
        matA = matA';
    end
    if size(matB, 2) == 1
        matB = matB';
    end
    
    % So we want to reorder A to match idxB
    [~, sortB, sortA] = intersect(idxB, idxA, 'stable'); % This shouldn't change the order of B?
    
    matA = matA(:, sortA);
    idxA = idxA(sortA);
    
    if nanFlag
        mat = nan(size(matA, 1), length(idxB));
        mat(:, sortB) = matA(:, sortA);
        matA = mat;
    else
        idxB = idxB(sortB);
        if ~isempty(matB)
            matB = matB(:, sortB);
        end
    end
end
