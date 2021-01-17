function setAxisNumTicks(whichAx, N, ax, tickrange)
%SETEAXISNUMTICKS
    if nargin < 3 || isempty(ax)
        ax = gca;
    end
    if nargin < 4
        tickrange = [];
    end
    if contains(whichAx, 'x')
        if isempty(tickrange)
            tickrange = maxmin(ax.XTick);
        end
        ax.XTick = linspace(tickrange(1), tickrange(2), N);
    end
    if contains(whichAx, 'y')
        if isempty(tickrange)
            tickrange = maxmin(ax.YTick);
        end
        ax.YTick = linspace(tickrange(1), tickrange(2), N);
    end
end

