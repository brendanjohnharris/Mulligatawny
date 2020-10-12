function colormap = interpColors(color1, color2, N)
%INTERPCOLORS Give two colours, and this function will produce a colourmap
%by linearly interpolating between them.
    if ischar(color1)
        color1 = bitget(find('krgybmcw'==color1)-1,1:3); %Wicked
        % https://stackoverflow.com/questions/4922383/how-can-i-convert-a-color-name-to-a-3-element-rgb-vector
    end
    if ischar(color2)
        color2 = bitget(find('krgybmcw'==color2)-1,1:3);
    end
    if nargin == 2 && isscalar(color2) && size(color1, 1) == 2
        N = color2;
        color2 = color1(2, :);
        color1 = color1(1, :);
    end
    colormap = interp1([1, N], [color1(:)'; color2(:)'], 1:N, 'linear');
end
