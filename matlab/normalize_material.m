function material = normalize_material(material)
%NORMALIZE_MATERIAL Validate elastic constants and add e, kappa1, kappa2.

required = {'E1', 'E2', 'nu1', 'nu2'};
for k = 1:numel(required)
    if ~isfield(material, required{k})
        error('characteristic_roots:MissingMaterialField', ...
            'Material structure lacks field %s.', required{k});
    end
end

if material.E1 <= 0 || material.E2 <= 0
    error('characteristic_roots:InvalidYoungModulus', ...
        'Young''s moduli E1 and E2 must be positive.');
end
if material.nu1 <= -1 || material.nu1 >= 0.5 || ...
        material.nu2 <= -1 || material.nu2 >= 0.5
    error('characteristic_roots:InvalidPoissonRatio', ...
        'Poisson ratios must lie in (-1, 0.5).');
end

material.e = (1 + material.nu2) * material.E1 / ...
    ((1 + material.nu1) * material.E2);
material.kappa1 = 3 - 4 * material.nu1;
material.kappa2 = 3 - 4 * material.nu2;
end
