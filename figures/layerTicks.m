function t = layerTicks(labels, xidxs, layer, varargin)
%LAYERTICKS Add multiple layers of x tick labels to the current plot
% Inputs are a label cell, a tick index vector, a layer number and then
% tick label properties as name value pairs. Call once for each layer.
% Don't change the x axis limits after creating these labels...
    f = gcf;
    ax = gca;
    % Look for existing tick labels
    if ~isempty(ax.XTickLabels)
        ax.XTickLabels = [];
    end
    
    heights = -0.025.*[2, 6, 12, 20];%, 50, 100]; % Can't want more than 4?!
    sizes = 11.*[1, 1.5, 2.5, 3.5];%, 5, 7.5]; 
    xTicks = ax.XTick;
    xidxs = (xidxs - min(xlim))./range(xlim); % tick scale to normalized scale
    % Look for any existing layer labels, and add in dummy layers if needed
    texts = findall(gca,'type','Text');
    if ~isempty(texts)
        theseHeights = cellfun(@(x) x(2), {texts.Position});
    else
        theseHeights = [];
    end
    if ~isempty(texts)
        theseTexts = {texts.Units};
    else
        theseTexts = [];
    end
    idxs = find(strcmpi(theseTexts, 'Normalized') & ismember(theseHeights, heights));
    texts = texts(idxs);
    theseHeights = theseHeights(idxs);
    delidxs = ismember(theseHeights, heights(layer));

    for i = delidxs
        %delete(texts(delidxs)) % nah
    end
    t = text(xidxs, repmat(heights(layer), 1, length(xidxs)), labels, 'Units', 'Normalized', 'HorizontalAlignment', 'center', 'FontSize', sizes(layer), varargin{:});
    ax.Position(2) = ax.Position(2) + ax.Position(4) - 0.5;
    ax.Position(4) = 0.5;
end
