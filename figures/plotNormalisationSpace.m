function plotNormalisationSpace(imfile)
%PLOTNORMALISATIONSPACE 
    figure('color', 'w');
    im = imread(imfile);
    clf
    imshow(im)
    %r = @(x) sqrt(x(:,1).^2 + x(:,2).^2);
    %w = @(x) atan2(x(:,2), x(:,1));
    f = @(x) [invSigmoid(x(:, 1), 0, 1), invSigmoid(x(:, 2), 0, 1)];
    g = @(x, unused) f(x);
    figure('color', 'w')
    tform2 = maketform('custom', 2, 2, [], g, []);
    face2 = imtransform(im, tform2, 'UData', [-3 3], 'VData', [-3 3], ...
        'XData', [-0.99 0.99], 'YData', [-0.99 0.99]);
    imshow(face2)
end
