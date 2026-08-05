function roots = calculate_characteristic_roots(alpha, material, options)
%CALCULATE_CHARACTERISTIC_ROOTS Compute lambda0, lambda, lambda1, lambda2.
%
% lambda1 is calculated directly with D1_corrected. This determinant is the
% material-interchange image of D2_printed and reproduces Fig. 4. The same
% root calculated through the explicit material swap, and the inconsistent
% direct root of D1_printed, are returned as audit fields.

if nargin < 3
    options = struct();
end
material = normalize_material(material);

roots.lambda0 = find_characteristic_roots('D0', alpha, material, options);
roots.lambda = find_characteristic_roots('D', alpha, material, options);
roots.lambda2 = find_characteristic_roots( ...
    'D2_printed', alpha, material, options);

roots.lambda1 = find_characteristic_roots( ...
    'D1_corrected', alpha, material, options);
roots.lambda1.note = [ ...
    'Symmetry-corrected material-1 branch; reproduces Fig. 4.'];

swapped = swap_materials(material);
roots.lambda1_symmetry = find_characteristic_roots( ...
    'D2_printed', pi - alpha, swapped, options);
roots.lambda1_symmetry.determinant = 'D2_printed after material swap';
roots.lambda1_symmetry.alpha_deg = alpha * 180 / pi;
roots.lambda1_symmetry.note = [ ...
    'Independent symmetry check for the corrected material-1 branch.'];

roots.lambda1_D1_printed = find_characteristic_roots( ...
    'D1_printed', alpha, material, options);
roots.lambda1_D1_printed.note = [ ...
    'Direct printed-D1 diagnostic; it does not reproduce the ', ...
    'material-symmetry branch in Fig. 4.'];
end
