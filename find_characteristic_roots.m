function result = find_characteristic_roots(kind, alpha, material, options)
%FIND_CHARACTERISTIC_ROOTS Real roots of D_j(-1-lambda)=0 in (-1,0).
%
% The default selection is the smallest (most negative) real lambda, as
% specified for lambda0 and lambda in the manuscript. All sign-changing
% roots are retained in result.roots.

if nargin < 4
    options = struct();
end
options = apply_defaults(options);
material = normalize_material(material);

if alpha <= 0 || alpha >= pi
    error('characteristic_roots:InvalidAlpha', ...
        'alpha must lie in (0, pi).');
end

equation = @(lambda) characteristic_determinant( ...
    kind, -1 - lambda, alpha, material);

lambdaGrid = linspace(-1 + options.endpoint_margin, ...
    -options.endpoint_margin, options.scan_points);
values = equation(lambdaGrid);
rootsFound = [];

for k = 1:(numel(lambdaGrid) - 1)
    fLeft = values(k);
    fRight = values(k + 1);
    if ~isfinite(fLeft) || ~isfinite(fRight)
        continue;
    end
    if fLeft == 0
        candidate = lambdaGrid(k);
    elseif fLeft * fRight < 0
        candidate = fzero(equation, [lambdaGrid(k), lambdaGrid(k + 1)]);
    else
        continue;
    end

    if isempty(rootsFound) || ...
            all(abs(rootsFound - candidate) > options.duplicate_tolerance)
        rootsFound(end + 1) = candidate; %#ok<AGROW>
    end
end

rootsFound = sort(rootsFound);
if isempty(rootsFound)
    selected = NaN;
    residual = NaN;
elseif strcmp(options.selector, 'smallest_lambda')
    selected = min(rootsFound);
    residual = abs(equation(selected));
elseif strcmp(options.selector, 'largest_lambda')
    selected = max(rootsFound);
    residual = abs(equation(selected));
else
    error('characteristic_roots:UnknownSelector', ...
        'Unknown root selector: %s.', options.selector);
end

result = struct( ...
    'determinant', char(kind), ...
    'alpha_deg', alpha * 180 / pi, ...
    'roots', rootsFound, ...
    'selected', selected, ...
    'residual', residual, ...
    'selector', options.selector, ...
    'note', '');
end

function options = apply_defaults(options)
defaults = struct( ...
    'scan_points', 20001, ...
    'endpoint_margin', 1e-8, ...
    'duplicate_tolerance', 1e-8, ...
    'selector', 'smallest_lambda');
names = fieldnames(defaults);
for k = 1:numel(names)
    if ~isfield(options, names{k})
        options.(names{k}) = defaults.(names{k});
    end
end
end
