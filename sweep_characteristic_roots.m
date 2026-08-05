function results = sweep_characteristic_roots(alphaDeg, material, options)
%SWEEP_CHARACTERISTIC_ROOTS Calculate the four exponents over angle values.

if nargin < 3
    options = struct();
end

alphaDeg = alphaDeg(:);
n = numel(alphaDeg);
lambda0 = nan(n, 1);
lambdaShear = nan(n, 1);
lambda1 = nan(n, 1);
lambda2 = nan(n, 1);
lambda1D1Printed = nan(n, 1);
residual0 = nan(n, 1);
residualShear = nan(n, 1);
residual1 = nan(n, 1);
residual2 = nan(n, 1);

for k = 1:n
    roots = calculate_characteristic_roots( ...
        alphaDeg(k) * pi / 180, material, options);
    lambda0(k) = roots.lambda0.selected;
    lambdaShear(k) = roots.lambda.selected;
    lambda1(k) = roots.lambda1.selected;
    lambda2(k) = roots.lambda2.selected;
    lambda1D1Printed(k) = roots.lambda1_D1_printed.selected;
    residual0(k) = roots.lambda0.residual;
    residualShear(k) = roots.lambda.residual;
    residual1(k) = roots.lambda1.residual;
    residual2(k) = roots.lambda2.residual;
end

results = table(alphaDeg, lambda0, lambdaShear, lambda1, lambda2, ...
    lambda1D1Printed, residual0, residualShear, residual1, residual2, ...
    'VariableNames', {'alpha_deg', 'lambda0', 'lambda', 'lambda1', ...
    'lambda2', 'lambda1_D1_printed', 'lambda0_residual', ...
    'lambda_residual', 'lambda1_residual', 'lambda2_residual'});
end
