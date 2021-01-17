function setAxisTickStep(whichAx, df, ax)
%SETEAXISTICKSTEP
    if nargin < 3 || isempty(ax)
        ax = gca;
    end
    if contains(whichAx, 'x')
        ax.XTick = ax.XTick(1):df:ax.XTick(end);
    end
    if contains(whichAx, 'y')
         ax.YTick = ax.YTick(1):df:ax.YTick(end);
    end
end

