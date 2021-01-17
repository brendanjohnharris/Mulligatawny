function diluteAxisTicks(whichAx, df, ax)
%DILUTEAXISTICKS Reduce the number of y axis ticks by a factor of df
    if nargin < 3 || isempty(ax)
        ax = gca;
    end
    if contains(whichAx, 'x')
        ax.XTick = ax.XTick(1:df:end);
    end
    if contains(whichAx, 'y')
        ax.YTick = ax.YTick(1:df:end);
    end
end

