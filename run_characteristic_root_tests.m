function run_characteristic_root_tests()
%RUN_CHARACTERISTIC_ROOT_TESTS Regression and symmetry tests.

material = struct('E1', 0.5, 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);
tolerance = 5e-7;

at45 = calculate_characteristic_roots(45 * pi / 180, material);
assert_close(at45.lambda0.selected, -0.0890898074554554, tolerance, ...
    'lambda0 at 45 degrees');
assert_close(at45.lambda.selected, -0.613197226573069, tolerance, ...
    'lambda at 45 degrees');
assert_close(at45.lambda1.selected, -0.393830808986692, tolerance, ...
    'lambda1 at 45 degrees');
assert_close(at45.lambda2.selected, -0.467538415699738, tolerance, ...
    'lambda2 at 45 degrees');

at135 = calculate_characteristic_roots(135 * pi / 180, material);
assert_close(at135.lambda0.selected, -0.111538168236385, tolerance, ...
    'lambda0 at 135 degrees');
assert_close(at135.lambda.selected, -0.546757699996872, tolerance, ...
    'lambda at 135 degrees');
assert_close(at135.lambda1.selected, -0.458591400438215, tolerance, ...
    'lambda1 at 135 degrees');
assert_close(at135.lambda2.selected, -0.300163929823271, tolerance, ...
    'lambda2 at 135 degrees');
assert_close(at135.lambda1_D1_printed.selected, -0.165819966896308, ...
    tolerance, 'direct printed D1 at 135 degrees');

swapped = swap_materials(material);
mirror = calculate_characteristic_roots(45 * pi / 180, swapped);
assert_close(at135.lambda0.selected, mirror.lambda0.selected, tolerance, ...
    'lambda0 material-swap symmetry');
assert_close(at135.lambda.selected, mirror.lambda.selected, tolerance, ...
    'lambda material-swap symmetry');
assert_close(at135.lambda1.selected, mirror.lambda2.selected, tolerance, ...
    'material-swap symmetry');

results = {at45.lambda0, at45.lambda, at45.lambda1, at45.lambda2, ...
    at135.lambda0, at135.lambda, at135.lambda1, at135.lambda2};
for k = 1:numel(results)
    assert(results{k}.residual < 1e-7, ...
        'Characteristic-equation residual is too large.');
end

fprintf('All characteristic-root tests passed.\n');
end

function assert_close(actual, expected, tolerance, label)
if isnan(actual) || abs(actual - expected) > tolerance
    error('characteristic_roots:RegressionFailure', ...
        '%s: expected %.15g, obtained %.15g.', label, expected, actual);
end
end
