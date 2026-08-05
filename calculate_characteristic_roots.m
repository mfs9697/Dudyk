function roots = calculate_characteristic_roots(alpha, material, options)
%CALCULATE_CHARACTERISTIC_ROOTS Compute lambda0, lambda, lambda1, lambda2.
%
% lambda1 is calculated with the material-interchange symmetry stated in
% the manuscript: alpha -> pi-alpha and material labels 1 <-> 2, followed
% by the printed D2 determinant. This reproduces the lambda1 branch in
% Fig. 4. The direct printed-D1 result is also returned as an audit field.

if nargin < 3
    options = struct();
end
material = normalize_material(material);

roots.lambda0 = find_characteristic_roots('D0', alpha, material, options);
roots.lambda = find_characteristic_roots('D', alpha, material, options);
roots.lambda2 = find_characteristic_roots( ...
    'D2_printed', alpha, material, options);

swapped = swap_materials(material);
roots.lambda1 = find_characteristic_roots( ...
    'D2_printed', pi - alpha, swapped, options);
roots.lambda1.determinant = 'D2_printed after material swap';
roots.lambda1.alpha_deg = alpha * 180 / pi;
roots.lambda1.note = 'Figure-4/material-symmetry branch for material 1.';

roots.lambda1_D1_printed = find_characteristic_roots( ...
    'D1_printed', alpha, material, options);
roots.lambda1_D1_printed.note = [ ...
    'Direct printed-D1 diagnostic; it does not reproduce the ', ...
    'material-symmetry branch in Fig. 4.'];
end
