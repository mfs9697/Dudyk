function options = figure3_factor_options(alpha, extensionFactor)
%FIGURE3_FACTOR_OPTIONS Angle-adaptive contour for the Figure-3 sweep.
%
% On p=i*t the slowest hyperbolic correction decays as
% exp(-2*t*min(alpha,pi-alpha)). Requiring the exponent to reach 24 gives
% the baseline truncation below. The lower bound 60 preserves the verified
% moderate-angle accuracy, and rounding to tens makes diagnostics legible.

if nargin < 2
    extensionFactor = 1;
end
if ~isscalar(alpha) || ~isfinite(alpha) || alpha <= 0 || alpha >= pi
    error('characteristic_roots:InvalidFigure3Angle', ...
        'Figure-3 alpha must be a finite scalar in (0,pi).');
end
if ~isscalar(extensionFactor) || ~isfinite(extensionFactor) ...
        || extensionFactor < 1
    error('characteristic_roots:InvalidContourExtension', ...
        'extensionFactor must be a finite scalar not smaller than one.');
end

edgeAngle = min(alpha, pi - alpha);
targetExponent = 24 .* extensionFactor;
truncation = max(60, targetExponent ./ (2 .* edgeAngle));
truncation = 10 .* ceil(truncation ./ 10);

options = struct( ...
    'truncation', truncation, ...
    'relative_tolerance', 1e-10, ...
    'absolute_tolerance', 1e-12);
end
