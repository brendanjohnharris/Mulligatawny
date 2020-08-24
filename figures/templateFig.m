function f = templateFig(f, aspect)
%TEMPLATEFIG 
    if nargin < 1 || isempty(f)
        f = figure();
    end
    if nargin < 2 || isempty(aspect)
        aspect = 1; % One column figure
    end
    scale = 2;
    f.Color = 'w';
    f.WindowStyle = 'normal';
    set(f, 'DefaultAxesFontSize', 8.*scale, 'DefaultAxesTitleFontSize', 1.*scale);
    f.Units = 'Centimeters';
    set(0,'units','Centimeters')
    scrn = get(0,'screensize');
    drawnow
    
    if aspect == 1
        width = 8.9.*scale;
        f.Position = [scrn(3)./2 - width./2, scrn(4)./2 - width*3/8, width, width*3/4];
    elseif aspect == 2
        %...........................
    end
    %................. default color order
    %...................
end

