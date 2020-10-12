function colormap = interpColors(color1, color2, N)
%INTERPCOLORS Give two colours, and this function will produce a colourmap
%by linearly interpolating between them.
    if nargin == 2 && isscalar(color2)
        N = color2;
        color2 = color1(2, :);
        color1 = color1(1, :);
    end
    colormap = interp1([1, N], [color1(:)'; color2(:)'], 1:N, 'linear');
end

