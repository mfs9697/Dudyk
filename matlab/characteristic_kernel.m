function value = characteristic_kernel(kind, p, alpha, material)
%CHARACTERISTIC_KERNEL Evaluate the Wiener-Hopf kernels in Eqs. (5) and (A.4).
%
%   kind = 'base'      gives G(p) from Appendix A.4.
%   kind = 'material1' gives G_1(p), using the symmetry-corrected D_1.
%   kind = 'material2' gives G_2(p), using the printed D_2.
%
% The removable p=0 singularities are evaluated analytically. Operations
% are vectorized in p.

material = normalize_material(material);
e = material.e;
k1 = material.kappa1;
k2 = material.kappa2;

switch char(kind)
    case 'base'
        numerator = (e + k1) .* (1 + e .* k2) .* sin(pi .* p) ...
            .* characteristic_determinant('D', p, alpha, material);
        denominator = (e + k1 + 1 + e .* k2) .* cos(pi .* p) ...
            .* characteristic_determinant('D0', p, alpha, material);
        value = numerator ./ denominator;

    case 'material1'
        numerator = characteristic_determinant( ...
            'D1_corrected', p, alpha, material) .* cos(pi .* p);
        denominator = characteristic_determinant( ...
            'D', p, alpha, material) .* sin(pi .* p);
        value = numerator ./ denominator;

    case 'material2'
        numerator = characteristic_determinant( ...
            'D2_printed', p, alpha, material) .* cos(pi .* p);
        denominator = characteristic_determinant( ...
            'D', p, alpha, material) .* sin(pi .* p);
        value = numerator ./ denominator;

    otherwise
        error('characteristic_roots:UnknownKernel', ...
            'Unknown kernel kind: %s.', char(kind));
end

% Direct evaluation loses relative precision because both numerator and
% denominator vanish at p=0. The leading Taylor coefficients give the
% finite kernel limits used in Eqs. (6), (9), and the factorization integral.
small = abs(p) < 1e-7;
if any(small(:))
    value(small) = kernel_zero_limit(kind, alpha, material);
end
end

function value = kernel_zero_limit(kind, alpha, material)
e = material.e;
k1 = material.kappa1;
k2 = material.kappa2;

beta = pi - alpha;
sin2a = sin(2 .* alpha);
cos2a = cos(2 .* alpha);
oneMinusCos2a = 1 - cos2a;

coefficientD = oneMinusCos2a .* ( ...
    (1 + k1) .* (2 .* alpha + sin2a) ...
    + e .* (1 + k2) .* (2 .* beta - sin2a));

switch char(kind)
    case 'base'
        coefficientB0 = (2 .* alpha + sin2a) ...
            .* (2 .* k1 .* beta + sin2a);
        coefficientB2 = (2 .* beta - sin2a) ...
            .* (2 .* k2 .* alpha - sin2a);
        coefficientB1 = (1 + k1) .* (1 + k2) .* pi.^2 ...
            - coefficientB0 - coefficientB2;
        coefficientD0 = coefficientB0 + e .* coefficientB1 ...
            + e.^2 .* coefficientB2;
        value = (e + k1) .* (1 + e .* k2) .* pi .* coefficientD ...
            ./ ((e + k1 + 1 + e .* k2) .* coefficientD0);

    case 'material1'
        coefficientD1 = 2 .* e .* (1 + k2) .* oneMinusCos2a ...
            .* (beta.^2 - sin(alpha).^2) ...
            + (1 + k1) .* (2 .* alpha + sin2a) ...
            .* (2 .* beta - sin2a);
        value = coefficientD1 ./ (pi .* coefficientD);

    case 'material2'
        coefficientD2 = 2 .* (1 + k1) .* oneMinusCos2a ...
            .* (alpha.^2 - sin(alpha).^2) ...
            + e .* (1 + k2) .* (2 .* beta - sin2a) ...
            .* (2 .* alpha + sin2a);
        value = coefficientD2 ./ (pi .* coefficientD);

    otherwise
        error('characteristic_roots:UnknownKernel', ...
            'Unknown kernel kind: %s.', char(kind));
end
end
