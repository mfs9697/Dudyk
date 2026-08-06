function [factor, diagnostics] = wiener_hopf_plus_factor( ...
        kernelFunction, p, options)
%WIENER_HOPF_PLUS_FACTOR Numerically evaluate a zero-index plus factor.
%
% For the manuscript kernels, F(i*t) is real, positive, even, and tends to
% one. For real p<0 the contour formula therefore reduces to
%
% log F^+(p) = -p/pi * integral_0^infinity ...
%              log(F(i*t))/(t^2+p^2) dt.
%
% The integral is truncated only after the kernel has converged to one.
% Diagnostics expose the axis checks and terminal error for reproducibility.

if nargin < 3
    options = struct();
end
options = apply_defaults(options);

if ~isa(kernelFunction, 'function_handle')
    error('characteristic_roots:InvalidKernelFunction', ...
        'kernelFunction must be a function handle.');
end
if any(~isreal(p(:))) || any(p(:) >= 0)
    error('characteristic_roots:InvalidFactorPoint', ...
        'The current plus-factor implementation requires real p<0.');
end

factor = zeros(size(p));
logFactor = zeros(size(p));
for k = 1:numel(p)
    point = p(k);
    integrand = @(t) positive_axis_log( ...
        kernelFunction, t, options.axis_tolerance) ...
        ./ (t.^2 + point.^2);
    integralValue = integral(integrand, 0, options.truncation, ...
        'RelTol', options.relative_tolerance, ...
        'AbsTol', options.absolute_tolerance);
    logFactor(k) = (-point ./ pi) .* integralValue;
    factor(k) = exp(logFactor(k));
end

sampleT = unique([0, logspace(-8, log10(options.truncation), ...
    options.diagnostic_points)]);
sampleValues = kernelFunction(1i .* sampleT);
sampleScale = max(1, abs(sampleValues));
maxRelativeImaginary = max(abs(imag(sampleValues)) ./ sampleScale);
realSamples = real(sampleValues);
if maxRelativeImaginary > options.axis_tolerance
    error('characteristic_roots:ComplexAxisKernel', ...
        'Kernel is not real on the imaginary axis (relative error %.3g).', ...
        maxRelativeImaginary);
end
if any(realSamples <= 0)
    error('characteristic_roots:NonPositiveAxisKernel', ...
        'Kernel is nonpositive on the sampled imaginary axis.');
end

diagnostics = struct( ...
    'p', p, ...
    'log_factor', logFactor, ...
    'truncation', options.truncation, ...
    'relative_tolerance', options.relative_tolerance, ...
    'absolute_tolerance', options.absolute_tolerance, ...
    'max_relative_axis_imaginary', maxRelativeImaginary, ...
    'minimum_axis_value', min(realSamples), ...
    'terminal_log_deviation', abs(log(realSamples(end))));
end

function values = positive_axis_log(kernelFunction, t, tolerance)
kernelValues = kernelFunction(1i .* t);
scale = max(1, abs(kernelValues));
relativeImaginary = abs(imag(kernelValues)) ./ scale;
if any(relativeImaginary(:) > tolerance)
    error('characteristic_roots:ComplexAxisKernel', ...
        'Kernel is not real on the imaginary axis.');
end
values = real(kernelValues);
if any(values(:) <= 0)
    error('characteristic_roots:NonPositiveAxisKernel', ...
        'Kernel is nonpositive on the imaginary axis.');
end
values = log(values);
end

function options = apply_defaults(options)
defaults = struct( ...
    'truncation', 40, ...
    'relative_tolerance', 1e-10, ...
    'absolute_tolerance', 1e-12, ...
    'axis_tolerance', 5e-10, ...
    'diagnostic_points', 240);
names = fieldnames(defaults);
for k = 1:numel(names)
    if ~isfield(options, names{k})
        options.(names{k}) = defaults.(names{k});
    end
end
if options.truncation <= 0
    error('characteristic_roots:InvalidFactorTruncation', ...
        'Factorization truncation must be positive.');
end
end
