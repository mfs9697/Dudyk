function admissibility = calculate_figure4_admissibility( ...
        alphaDeg, lambda0, material)
%CALCULATE_FIGURE4_ADMISSIBILITY Physical branch masks for Fig. 4.
%
% The masks enforce the two inequalities used in the manuscript,
%
%     C*g2 < 0,    C*Qi > 0.
%
% The signs of Q1 and Q2 are only documented in the manuscript for the
% Figure-4 baseline E1/E2 = 0.5 and nu1 = nu2 = 0.3. This function therefore
% refuses other material pairs instead of implying unverified admissibility.

alphaDeg = alphaDeg(:);
lambda0 = lambda0(:);
if numel(alphaDeg) ~= numel(lambda0)
    error('characteristic_roots:AdmissibilitySizeMismatch', ...
        'alphaDeg and lambda0 must contain the same number of values.');
end
if any(diff(alphaDeg) <= 0)
    error('characteristic_roots:AdmissibilityAngleOrder', ...
        'alphaDeg must be strictly increasing.');
end

material = normalize_material(material);
baselineTolerance = 1e-12;
if abs(material.E1 / material.E2 - 0.5) > baselineTolerance || ...
        abs(material.nu1 - 0.3) > baselineTolerance || ...
        abs(material.nu2 - 0.3) > baselineTolerance
    error('characteristic_roots:UnverifiedAdmissibility', [ ...
        'The Q1/Q2 sign map is verified only for the Figure-4 baseline ', ...
        'E1/E2 = 0.5 and nu1 = nu2 = 0.3.']);
end

alpha = alphaDeg * pi / 180;
g2 = (1 - material.e) .* cos(lambda0 .* (pi - alpha)) .* ( ...
    (lambda0 + 1) .* sin(2 * alpha) + ...
    sin(2 * (lambda0 + 1) .* alpha)) + ...
    material.e * (1 + material.kappa2) .* sin(lambda0 * pi) .* ...
    cos((lambda0 + 2) .* alpha);

q1Sign = nan(size(alphaDeg));
q1Sign(alphaDeg < 90) = -1;
q1Sign(alphaDeg > 90) = 1;
q2Sign = -q1Sign;
valid = isfinite(lambda0) & isfinite(g2) & alphaDeg > 0 & ...
    alphaDeg < 180 & alphaDeg ~= 90;

admissibility.alpha_deg = alphaDeg;
admissibility.g2 = g2;
admissibility.C_positive.material1 = ...
    valid & g2 < 0 & q1Sign > 0;
admissibility.C_positive.material2 = ...
    valid & g2 < 0 & q2Sign > 0;
admissibility.C_negative.material1 = ...
    valid & g2 > 0 & q1Sign < 0;
admissibility.C_negative.material2 = ...
    valid & g2 > 0 & q2Sign < 0;

transitions = interpolate_sign_changes(alphaDeg, g2);
if numel(transitions) ~= 2 || transitions(1) >= 90 || transitions(2) <= 90
    error('characteristic_roots:UnexpectedG2Transitions', ...
        'Expected one g2 sign change on each side of 90 degrees.');
end
admissibility.alpha1_deg = transitions(1);
admissibility.alpha2_deg = transitions(2);
end

function transitions = interpolate_sign_changes(alphaDeg, values)
transitions = zeros(0, 1);
for k = 1:(numel(alphaDeg) - 1)
    if ~isfinite(values(k)) || ~isfinite(values(k + 1))
        continue;
    end
    if values(k) == 0
        transitions(end + 1, 1) = alphaDeg(k); %#ok<AGROW>
    elseif values(k) * values(k + 1) < 0
        transitions(end + 1, 1) = alphaDeg(k) - values(k) * ...
            (alphaDeg(k + 1) - alphaDeg(k)) / ...
            (values(k + 1) - values(k)); %#ok<AGROW>
    end
end
if isfinite(values(end)) && values(end) == 0
    transitions(end + 1, 1) = alphaDeg(end);
end
transitions = unique(transitions);
end
