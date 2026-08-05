%EXAMPLE_REPRODUCE_ROOTS Baseline calculation used for manuscript Fig. 4.

clear;
material = struct('E1', 0.5, 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);

fprintf(' E1/E2 = %.3f, nu1 = nu2 = %.3f\n', ...
    material.E1 / material.E2, material.nu1);
fprintf(' alpha   lambda0      lambda       lambda1      lambda2\n');

for alphaDeg = [15, 30, 45, 60, 75, 105, 120, 135, 150, 165]
    result = calculate_characteristic_roots(alphaDeg * pi / 180, material);
    fprintf('%6.1f  %11.7f  %11.7f  %11.7f  %11.7f\n', ...
        alphaDeg, result.lambda0.selected, result.lambda.selected, ...
        result.lambda1.selected, result.lambda2.selected);
end
