function value = characteristic_kernel(kind, p, alpha, material)
%CHARACTERISTIC_KERNEL Evaluate the Wiener-Hopf kernels in Eqs. (5) and (A.4).
%
%   kind = 'base'      gives G(p) from Appendix A.4.
%   kind = 'material1' gives G_1(p), using the symmetry-corrected D_1.
%   kind = 'material2' gives G_2(p), using the printed D_2.
%
% The removable p=0 singularities are evaluated analytically. On the
% imaginary factorization axis, large arguments are evaluated after removal
% of the common exp(2*pi*|Im(p)|) determinant scale. This prevents Inf/Inf
% cancellation without changing the kernel ratios.

material = normalize_material(material);

axisTolerance = 64 .* eps .* max(1, abs(p));
scaledAxis = abs(real(p)) <= axisTolerance & abs(imag(p)) >= 8;
value = nan(size(p));

if any(~scaledAxis(:))
    value(~scaledAxis) = direct_kernel( ...
        kind, p(~scaledAxis), alpha, material);
end
if any(scaledAxis(:))
    value(scaledAxis) = scaled_imaginary_axis_kernel( ...
        kind, abs(imag(p(scaledAxis))), alpha, material);
end

% Direct evaluation loses relative precision because both numerator and
% denominator vanish at p=0. The leading Taylor coefficients give the
% finite kernel limits used in Eqs. (6), (9), and the factorization integral.
small = abs(p) < 1e-7;
if any(small(:))
    value(small) = kernel_zero_limit(kind, alpha, material);
end
end

function value = direct_kernel(kind, p, alpha, material)
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
end

function value = scaled_imaginary_axis_kernel( ...
        kind, t, alpha, material)
% Every determinant term on p=i*t has the common scale exp(2*pi*t).
% The variables below contain the hyperbolic brackets after that scale has
% been distributed between their alpha and pi-alpha factors.

e = material.e;
k1 = material.kappa1;
k2 = material.kappa2;
beta = pi - alpha;
sin2a = sin(2 .* alpha);
cos2a = cos(2 .* alpha);
sina2 = sin(alpha).^2;

xAlpha = 2 .* t .* alpha;
xBeta = 2 .* t .* beta;
expAlpha = exp(-xAlpha);
expBeta = exp(-xBeta);
sinhAlpha = scaled_sinh(xAlpha);
sinhBeta = scaled_sinh(xBeta);
sinhPi = scaled_sinh(pi .* t);
coshPi = scaled_cosh(pi .* t);

alphaPlus = sinhAlpha + t .* sin2a .* expAlpha;
alphaMinus = sinhAlpha - t .* sin2a .* expAlpha;
betaPlus = sinhBeta + t .* sin2a .* expBeta;
betaMinus = sinhBeta - t .* sin2a .* expBeta;
kappa1BetaPlus = k1 .* sinhBeta + t .* sin2a .* expBeta;
kappa2AlphaMinus = k2 .* sinhAlpha - t .* sin2a .* expAlpha;

coshAlphaDifference = scaled_cosh(xAlpha) - cos2a .* expAlpha;
coshBetaDifference = scaled_cosh(xBeta) - cos2a .* expBeta;

% D0(i*t)*exp(-2*pi*t).
b0 = -alphaPlus .* kappa1BetaPlus;
b2 = -betaMinus .* kappa2AlphaMinus;
b1 = -(1 + k1) .* (1 + k2) .* sinhPi.^2 - b0 - b2;
d0Scaled = b0 + e .* b1 + e.^2 .* b2;

% D(i*t)=i*dScaled*exp(2*pi*t).
dScaled = (1 + k1) .* coshBetaDifference .* alphaPlus ...
    + e .* (1 + k2) .* coshAlphaDifference .* betaMinus;

switch char(kind)
    case 'base'
        prefactor = (e + k1) .* (1 + e .* k2) ...
            ./ (e + k1 + 1 + e .* k2);
        value = -prefactor .* (sinhPi ./ coshPi) ...
            .* dScaled ./ d0Scaled;

    case {'material1', 'material2'}
        halfAlphaSinh = scaled_sinh(t .* alpha);
        halfBetaSinh = scaled_sinh(t .* beta);
        alphaSquareDifference = t.^2 .* sina2 .* exp(-2 .* t .* alpha) ...
            - halfAlphaSinh.^2;
        betaSquareDifference = t.^2 .* sina2 .* exp(-2 .* t .* beta) ...
            - halfBetaSinh.^2;

        if strcmp(char(kind), 'material1')
            determinantScaled = 2 .* e .* (1 + k2) ...
                .* coshAlphaDifference .* betaSquareDifference ...
                - (1 + k1) .* alphaPlus .* betaMinus;
        else
            determinantScaled = 2 .* (1 + k1) ...
                .* coshBetaDifference .* alphaSquareDifference ...
                - e .* (1 + k2) .* betaMinus .* alphaPlus;
        end
        value = -determinantScaled .* coshPi ...
            ./ (dScaled .* sinhPi);

    otherwise
        error('characteristic_roots:UnknownKernel', ...
            'Unknown kernel kind: %s.', char(kind));
end
end

function value = scaled_sinh(x)
% sinh(x)*exp(-x), evaluated without overflow or small-x cancellation.
value = -0.5 .* expm1(-2 .* x);
end

function value = scaled_cosh(x)
% cosh(x)*exp(-x).
value = 0.5 .* (1 + exp(-2 .* x));
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
