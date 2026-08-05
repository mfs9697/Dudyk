function value = characteristic_determinant(kind, p, alpha, material)
%CHARACTERISTIC_DETERMINANT Evaluate D0, D, printed D1, or printed D2.
%
%   value = characteristic_determinant(kind, p, alpha, material)
%
% alpha is in radians. Operations are vectorized in p. The formulas are
% transcribed from Eqs. (5), (A.2), and (A.4) of the supplied manuscript.

material = normalize_material(material);
e = material.e;
k1 = material.kappa1;
k2 = material.kappa2;

sin2pa = sin(2 .* p .* alpha);
sin2pba = sin(2 .* p .* (pi - alpha));
sin2a = sin(2 .* alpha);
cos2pa = cos(2 .* p .* alpha);
cos2pba = cos(2 .* p .* (pi - alpha));
cos2a = cos(2 .* alpha);
sinpa2 = sin(p .* alpha).^2;
sinpba2 = sin(p .* (pi - alpha)).^2;
sina2 = sin(alpha).^2;

switch char(kind)
    case 'D0'
        leftPlus = sin2pa + p .* sin2a;
        rightK1Plus = k1 .* sin2pba + p .* sin2a;
        rightMinus = sin2pba - p .* sin2a;
        leftK2Minus = k2 .* sin2pa - p .* sin2a;

        b0 = leftPlus .* rightK1Plus;
        b1 = (1 + k1) .* (1 + k2) .* sin(p .* pi).^2 ...
            - leftPlus .* rightK1Plus ...
            - rightMinus .* leftK2Minus;
        b2 = rightMinus .* leftK2Minus;
        value = b0 + e .* b1 + e.^2 .* b2;

    case 'D'
        a0 = (1 + k1) .* (cos2pba - cos2a) ...
            .* (sin2pa + p .* sin2a);
        a1 = (1 + k2) .* (cos2pa - cos2a) ...
            .* (sin2pba - p .* sin2a);
        value = a0 + e .* a1;

    case 'D1_printed'
        value = 2 .* e .* (1 + k2) .* (cos2pa - cos2a) ...
            .* (sinpba2 - p.^2 .* sina2) ...
            + (1 + k1) .* (sin2pa - p .* sin2a) ...
            .* (sin2pba + p .* sin2a);

    case 'D2_printed'
        value = 2 .* (1 + k1) .* (cos2pba - cos2a) ...
            .* (sinpa2 - p.^2 .* sina2) ...
            + e .* (1 + k2) .* (sin2pba - p .* sin2a) ...
            .* (sin2pa + p .* sin2a);

    otherwise
        error('characteristic_roots:UnknownDeterminant', ...
            'Unknown determinant kind: %s.', char(kind));
end
end
