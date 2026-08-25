function T = verify_table1_transition_angles()
%VERIFY_TABLE1_TRANSITION_ANGLES Independent MATLAB check of manuscript Table 1.
%
% The transition angles alpha1 < 90 deg and alpha2 > 90 deg satisfy
%
%   g2(alpha,lambda0) = 0,
%   D0(-1-lambda0)    = 0,
%
% with nu1 = nu2 = 0.3 and the physical lambda0 branch selected as the
% most negative real root in (-1,0).  The script deliberately reuses the
% audited MATLAB implementations CHARACTERISTIC_DETERMINANT and
% FIND_CHARACTERISTIC_ROOTS rather than the Python Table-1 script.
%
% Output:
%   T  MATLAB table with author values, recalculated values, residuals,
%      and differences.  The same data are written to
%      results/table1_transition_angles_matlab.csv.

ratios = [0.01 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 0.99]';
authorAlpha1 = [2.6 7.1 9.2 10.8 12.0 12.9 13.7 14.5 15.1 15.6 16.1]';
authorAlpha2 = [108.0 107.9 107.7 107.5 107.3 107.1 106.9 106.7 106.5 106.3 106.2]';

rootOptions = struct( ...
    'scan_points', 4001, ...
    'endpoint_margin', 1e-8, ...
    'duplicate_tolerance', 1e-9, ...
    'selector', 'smallest_lambda');

n = numel(ratios);
alpha1 = nan(n,1);
alpha2 = nan(n,1);
lambda01 = nan(n,1);
lambda02 = nan(n,1);
D0res1 = nan(n,1);
D0res2 = nan(n,1);
g2res1 = nan(n,1);
g2res2 = nan(n,1);

fprintf('MATLAB verification of manuscript Table 1\n');
fprintf('nu1 = nu2 = 0.3\n\n');

for k = 1:n
    material = struct('E1', ratios(k), 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);

    bracket1 = make_bracket(material, authorAlpha1(k), 0.05, 89.95, rootOptions);
    bracket2 = make_bracket(material, authorAlpha2(k), 90.05, 179.95, rootOptions);

    alpha1(k) = fzero(@(a) g2_of_alpha_deg(a, material, rootOptions), bracket1);
    alpha2(k) = fzero(@(a) g2_of_alpha_deg(a, material, rootOptions), bracket2);

    [g2res1(k), lambda01(k), D0res1(k)] = ...
        g2_of_alpha_deg(alpha1(k), material, rootOptions);
    [g2res2(k), lambda02(k), D0res2(k)] = ...
        g2_of_alpha_deg(alpha2(k), material, rootOptions);

    fprintf(['E1/E2=%5.2f: alpha1=%12.9f deg, alpha2=%12.9f deg, ' ...
             '|g2|=(%.3e, %.3e), |D0|=(%.3e, %.3e)\n'], ...
        ratios(k), alpha1(k), alpha2(k), abs(g2res1(k)), abs(g2res2(k)), ...
        D0res1(k), D0res2(k));
end

T = table(ratios, authorAlpha1, alpha1, alpha1-authorAlpha1, ...
    authorAlpha2, alpha2, alpha2-authorAlpha2, ...
    lambda01, lambda02, D0res1, D0res2, abs(g2res1), abs(g2res2), ...
    'VariableNames', { ...
    'E1_over_E2', ...
    'alpha1_author_deg', 'alpha1_matlab_deg', 'alpha1_difference_deg', ...
    'alpha2_author_deg', 'alpha2_matlab_deg', 'alpha2_difference_deg', ...
    'lambda0_at_alpha1', 'lambda0_at_alpha2', ...
    'D0_residual_alpha1', 'D0_residual_alpha2', ...
    'g2_residual_alpha1', 'g2_residual_alpha2'});

disp(T(:,1:7));

repoRoot = fileparts(fileparts(mfilename('fullpath')));
outfile = fullfile(repoRoot, 'results', 'table1_transition_angles_matlab.csv');
writetable(T, outfile);
fprintf('\nWrote %s\n', outfile);

fprintf('\nRounded-to-0.1-deg comparison:\n');
for k = 1:n
    fprintf(['%5.2f: alpha1 %.1f -> %.1f ; alpha2 %.1f -> %.1f\n'], ...
        ratios(k), authorAlpha1(k), round(alpha1(k),1), ...
        authorAlpha2(k), round(alpha2(k),1));
end

end

function bracket = make_bracket(material, centre, lowerLimit, upperLimit, options)
% First try a narrow bracket around the author's tabulated value.  The
% author value is used only to locate the sign change, never to determine
% the root itself.

halfWidth = 0.25;
while halfWidth <= 5.0
    left = max(lowerLimit, centre-halfWidth);
    right = min(upperLimit, centre+halfWidth);
    fLeft = g2_of_alpha_deg(left, material, options);
    fRight = g2_of_alpha_deg(right, material, options);
    if isfinite(fLeft) && isfinite(fRight) && fLeft*fRight <= 0
        bracket = [left right];
        return;
    end
    halfWidth = 2*halfWidth;
end

% Fallback: independent scan over the corresponding half interval.
grid = linspace(lowerLimit, upperLimit, 181);
values = nan(size(grid));
for j = 1:numel(grid)
    values(j) = g2_of_alpha_deg(grid(j), material, options);
end
for j = 1:numel(grid)-1
    if isfinite(values(j)) && isfinite(values(j+1)) && values(j)*values(j+1) <= 0
        bracket = grid(j:j+1);
        return;
    end
end
error('table1:NoTransitionBracket', ...
    'Could not bracket a g2 sign change near alpha = %.6g deg.', centre);
end

function [value, lambda0, D0residual] = g2_of_alpha_deg(alphaDeg, material, options)
alpha = alphaDeg*pi/180;
material = normalize_material(material);
root = find_characteristic_roots('D0', alpha, material, options);
lambda0 = root.selected;
if ~isfinite(lambda0)
    value = NaN;
    D0residual = NaN;
    return;
end

D0residual = abs(characteristic_determinant( ...
    'D0', -1-lambda0, alpha, material));

value = (1-material.e) .* cos(lambda0.*(pi-alpha)) .* ( ...
    (lambda0+1).*sin(2.*alpha) + sin(2.*(lambda0+1).*alpha)) ...
    + material.e.*(1+material.kappa2).*sin(lambda0.*pi) .* ...
      cos((lambda0+2).*alpha);
end
