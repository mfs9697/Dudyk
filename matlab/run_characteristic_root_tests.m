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
assert_close(at45.lambda1.selected, at45.lambda1_symmetry.selected, ...
    1e-10, 'corrected D1 versus material swap at 45 degrees');
assert(isnan(at45.lambda1_D1_printed.selected), ...
    'Printed D1 should have no selected interior root at 45 degrees.');

at135 = calculate_characteristic_roots(135 * pi / 180, material);
assert_close(at135.lambda0.selected, -0.111538168236385, tolerance, ...
    'lambda0 at 135 degrees');
assert_close(at135.lambda.selected, -0.546757699996872, tolerance, ...
    'lambda at 135 degrees');
assert_close(at135.lambda1.selected, -0.458591400438215, tolerance, ...
    'lambda1 at 135 degrees');
assert_close(at135.lambda2.selected, -0.300163929823271, tolerance, ...
    'lambda2 at 135 degrees');
assert_close(at135.lambda1.selected, at135.lambda1_symmetry.selected, ...
    1e-10, 'corrected D1 versus material swap at 135 degrees');
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

% The corrected D1 determinant must equal e times transformed D2 pointwise,
% including for unequal Poisson ratios.
testMaterials = {material, ...
    struct('E1', 2.3, 'E2', 1.1, 'nu1', 0.22, 'nu2', 0.34)};
for materialIndex = 1:numel(testMaterials)
    normalized = normalize_material(testMaterials{materialIndex});
    swappedForIdentity = swap_materials(normalized);
    for alphaDeg = [15, 45, 75, 105, 135, 165]
        alpha = alphaDeg * pi / 180;
        for p = [-0.9, -0.5, -0.1]
            direct = characteristic_determinant( ...
                'D1_corrected', p, alpha, normalized);
            transformed = normalized.e * characteristic_determinant( ...
                'D2_printed', p, pi - alpha, swappedForIdentity);
            assert_close(direct, transformed, 5e-13, ...
                'corrected D1 determinant identity');
        end
    end
end

% The printed D1 is not the material-symmetry image of D2.
normalized = normalize_material(material);
p = -0.4;
alpha = 135 * pi / 180;
directPrinted = characteristic_determinant( ...
    'D1_printed', p, alpha, normalized);
transformed = normalized.e * characteristic_determinant( ...
    'D2_printed', p, pi - alpha, swapped);
assert(abs(directPrinted - transformed) > 1e-2, ...
    'Printed D1 unexpectedly satisfies material-swap symmetry.');

results = {at45.lambda0, at45.lambda, at45.lambda1, ...
    at45.lambda1_symmetry, at45.lambda2, at135.lambda0, at135.lambda, ...
    at135.lambda1, at135.lambda1_symmetry, at135.lambda2};
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
