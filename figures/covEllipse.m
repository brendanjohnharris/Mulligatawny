function p = covEllipse(mu, sigma, varargin)
%ELLIPSE Plot an ellipse given centre and covariance matrix, using the fill
%function. Will sqrt the covariances so that they scale ellipse size linearly
% sqrt(Sigmas) correspond to 'radii', not 'diameters'
    if isrow(mu)
        mu = mu';
    end
    sigma = arrayfun(@(x) sign(x).*sqrt(abs(x)), sigma);
    [V, D] = eig(sigma);
    t = linspace(0, 2.*pi, 100);
    x = D(1).*cos(t);
    y = D(4).*sin(t);
    %angle = acos(dot(V(:, 1), [1, 0])./norm(V(:, 1)));
    %rot = [cos(angle), -sin(angle); sin(angle), cos(angle)];
    X = (V./vecnorm(V))\[x; y] + mu;
    p = fill(X(1, :), X(2, :), varargin{:});
end
