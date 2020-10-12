function f = featureCluster(pmat, leftAnnot, rightAnnot, cLabel, cmap)
%FEATURECLUSTER Show a similarity matrix, with annotations
    if nargin < 2 || isempty(leftAnnot)
        leftAnnot = repmat({''}, size(pmat, 1), 1);
    end
    if nargin < 3 || isempty(rightAnnot)
         rightAnnot = repmat({''}, size(pmat, 1), 1);
    end
    if nargin < 4 || isempty(cLabel)
        cLabel = '';
    end
    if nargin < 5 || isempty(cmap)
        cmap = interpColors('w', 'k', 100);
    end
    if isrow(leftAnnot)
        leftAnnot = leftAnnot';
    end
    if isrow(rightAnnot)
        rightAnnot = rightAnnot';
    end
    %figure('color', 'w')
    delete(gca)
    imagesc(pmat)
    ax = gca;
    tickidxs = 1:length(leftAnnot);
    ax.XAxis.MinorTickValues = [];
    ax.YAxis.MinorTickValues = ax.XTick;
    ax.XAxis.TickValues = [];
    ax.YAxis.TickValues = tickidxs;
    ax.XAxis.TickLabels = [];
    ax.YAxis.TickLabels = leftAnnot(tickidxs);
    ax.FontSize = 8;
    ax.TickLabelInterpreter = 'none';
    ax.XAxis.TickLabelRotation = 90;
    set(gcf, 'color', 'w')
    
    yyaxis right
    ax.YAxis(2).Limits = ax.YAxis(1).Limits;
    tickidxs = 1:length(rightAnnot);
    ax.YAxis(2).MinorTickValues = ax.XTick;
    ax.YAxis(2).TickValues = tickidxs;
    ax.YAxis(2).TickLabels = rightAnnot(tickidxs);
    ax.YAxis(2).Color = 'k';
    set(gcf, 'color', 'w')
    
    yyaxis left
    colormap(cmap);
    c = colorbar;
    %axis xy
    axis square
    ax.FontSize = 10;
    %caxis([0, 1])
    c.FontSize = 15;
    %c.Ticks = c.Ticks(1:2:end);
    c.Label.String = cLabel;
    c.Label.Interpreter = 'LaTeX';
    c.Label.FontSize = 20;
    c.Label.Rotation = 0;
    c.Location = 'southoutside';
    %c.Label.Position = c.Label.Position.*[1.2, 1.025, 0];
    set(gca, 'TickLength',[0 0])  
end

