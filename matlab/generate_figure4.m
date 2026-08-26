function generate_figure4()
%GENERATE_FIGURE4 Plot complete roots, admissible segments, and the D1 audit.

projectRoot = fileparts(fileparts(mfilename('fullpath')));
resultsDir = fullfile(projectRoot, 'results');
figuresDir = fullfile(projectRoot, 'figures');
if ~isfolder(figuresDir)
    mkdir(figuresDir);
end

csvPath = fullfile(resultsDir, 'baseline_roots_matlab_1deg.csv');
material = struct('E1', 0.5, 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);
if isfile(csvPath)
    data = readtable(csvPath);
else
    data = sweep_characteristic_roots((1:179)', material);
    writetable(data, csvPath);
end
requiredVariables = {'alpha_deg', 'lambda0', 'lambda', 'lambda1', ...
    'lambda2', 'lambda1_D1_printed'};
if ~all(ismember(requiredVariables, data.Properties.VariableNames))
    error('characteristic_roots:Figure4DataColumns', ...
        'The baseline CSV lacks one or more columns required by Figure 4.');
end
admissibility = calculate_figure4_admissibility( ...
    data.alpha_deg, data.lambda0, material);

% Complete mathematical branches. NaN at 90 degrees intentionally breaks
% the curves at the degenerate flat-interface limit.
fig = figure('Color', 'w', 'Position', [100, 100, 700, 410]);
hold on;
plot(data.alpha_deg, data.lambda0, 'Color', [0.45, 0.22, 0.65], ...
    'LineWidth', 1.8, 'DisplayName', '$\lambda_0$');
plot(data.alpha_deg, data.lambda, 'Color', [0.78, 0.12, 0.12], ...
    'LineWidth', 1.8, 'DisplayName', '$\lambda$');
plot(data.alpha_deg, data.lambda1, 'Color', [0.10, 0.55, 0.22], ...
    'LineWidth', 1.8, 'DisplayName', '$\lambda_1$');
plot(data.alpha_deg, data.lambda2, 'Color', [0.05, 0.35, 0.75], ...
    'LineWidth', 1.8, 'DisplayName', '$\lambda_2$');
mark_degenerate_limit(gca);
hold off;
format_axes(gca);
legendHandle = legend('Location', 'south', 'NumColumns', 4, 'Box', 'off', ...
    'Interpreter', 'latex');
format_legend(legendHandle);
exportgraphics(fig, fullfile(figuresDir, 'figure4_recalculated.pdf'), ...
    'ContentType', 'vector');
exportgraphics(fig, fullfile(figuresDir, 'figure4_recalculated.png'), ...
    'Resolution', 600);
close(fig);

% Reconstruct the physical content of the original Fig. 4. Thin gray lines
% show the complete lambda1/lambda2 solutions; saturated line segments show
% only where C*g2 < 0 and C*Qi > 0 are simultaneously satisfied.
fig = figure('Color', 'w', 'Position', [100, 100, 730, 440]);
hold on;
hComplete = plot(data.alpha_deg, data.lambda1, ':', ...
    'Color', [0.65, 0.65, 0.65], 'LineWidth', 1.0, ...
    'DisplayName', '$\lambda_1,\lambda_2\;\mathrm{(complete)}$');
plot(data.alpha_deg, data.lambda2, ':', 'Color', [0.65, 0.65, 0.65], ...
    'LineWidth', 1.0, 'HandleVisibility', 'off');

green = [0.10, 0.58, 0.25];
blue = [0.05, 0.38, 0.78];
hCpos2 = plot_masked_curve(data.alpha_deg, data.lambda2, ...
    admissibility.C_positive.material2, '--', green, ...
    '$\sigma^{\prime}=+0.5,\;C>0,\;\lambda_2$', ...
    admissibility.alpha1_deg);
hCneg2 = plot_masked_curve(data.alpha_deg, data.lambda2, ...
    admissibility.C_negative.material2, '--', blue, ...
    '$\sigma^{\prime}=-0.5,\;C<0,\;\lambda_2$', ...
    [90, admissibility.alpha2_deg]);
hCneg1 = plot_masked_curve(data.alpha_deg, data.lambda1, ...
    admissibility.C_negative.material1, '-', blue, ...
    '$\sigma^{\prime}=-0.5,\;C<0,\;\lambda_1$', ...
    [admissibility.alpha1_deg, 90]);
hCpos1 = plot_masked_curve(data.alpha_deg, data.lambda1, ...
    admissibility.C_positive.material1, '-', green, ...
    '$\sigma^{\prime}=+0.5,\;C>0,\;\lambda_1$', ...
    admissibility.alpha2_deg);
hLambda0 = plot(data.alpha_deg, data.lambda0, ...
    'Color', [0.45, 0.22, 0.65], 'LineWidth', 1.8, ...
    'DisplayName', '$\lambda_0$');
hLambda = plot(data.alpha_deg, data.lambda, ...
    'Color', [0.78, 0.12, 0.12], 'LineWidth', 1.8, ...
    'DisplayName', '$\lambda$');
mark_degenerate_limit(gca);
hold off;
format_axes(gca);
% With two columns this order pairs the two C>0 branches, the two C<0
% branches, and lambda0/lambda on common rows; the gray audit entry occupies
% the last row by itself.
legendHandle = legend([hCpos2, hCneg2, hLambda0, hComplete, ...
    hCpos1, hCneg1, hLambda], ...
    'Location', 'south', 'NumColumns', 2, 'Box', 'off', ...
    'Interpreter', 'latex');
format_legend(legendHandle);
exportgraphics(fig, fullfile(figuresDir, ...
    'figure4_admissible_segments.pdf'), 'ContentType', 'vector');
exportgraphics(fig, fullfile(figuresDir, ...
    'figure4_admissible_segments.png'), 'Resolution', 600);
close(fig);

% Keep the manuscript defect outside the publication figure.
fig = figure('Color', 'w', 'Position', [100, 100, 700, 410]);
hold on;
plot(data.alpha_deg, data.lambda1, 'Color', [0.10, 0.55, 0.22], ...
    'LineWidth', 1.8, 'DisplayName', '$D_1\;\mathrm{(corrected)}$');
plot(data.alpha_deg, data.lambda1_D1_printed, 'k--', ...
    'LineWidth', 1.4, 'DisplayName', '$D_1\;\mathrm{(printed)}$');
mark_degenerate_limit(gca);
hold off;
format_axes(gca);
legendHandle = legend('Location', 'southwest', 'Box', 'off', ...
    'Interpreter', 'latex');
format_legend(legendHandle);
exportgraphics(fig, fullfile(figuresDir, 'figure4_D1_audit.pdf'), ...
    'ContentType', 'vector');
exportgraphics(fig, fullfile(figuresDir, 'figure4_D1_audit.png'), ...
    'Resolution', 600);
close(fig);

fprintf(['Figure 4 admissibility transitions: alpha1 = %.3f deg, ', ...
    'alpha2 = %.3f deg.\n'], admissibility.alpha1_deg, ...
    admissibility.alpha2_deg);
fprintf(['Wrote complete curves, admissible segments, and D1 audit ', ...
    'plots to %s.\n'], figuresDir);
end

function handle = plot_masked_curve(alphaDeg, values, mask, ...
        lineStyle, color, displayName, boundaryAngles)
segmentAngles = alphaDeg(mask);
segmentValues = values(mask);
finiteValues = isfinite(values);
for k = 1:numel(boundaryAngles)
    boundary = boundaryAngles(k);
    if boundary == 90
        boundaryValue = 0;
    else
        boundaryValue = interp1(alphaDeg(finiteValues), ...
            values(finiteValues), boundary, 'linear');
    end
    segmentAngles(end + 1, 1) = boundary; %#ok<AGROW>
    segmentValues(end + 1, 1) = boundaryValue; %#ok<AGROW>
end
[segmentAngles, order] = sort(segmentAngles);
segmentValues = segmentValues(order);
handle = plot(segmentAngles, segmentValues, lineStyle, 'Color', color, ...
    'LineWidth', 1.9, 'DisplayName', displayName);
end

function mark_degenerate_limit(ax)
xline(ax, 90, ':', 'Color', [0.35, 0.35, 0.35], ...
    'LineWidth', 0.9, 'HandleVisibility', 'off');
end

function format_axes(ax)
ax.FontName = 'Times New Roman';
ax.FontSize = 10.5;
ax.LineWidth = 0.8;
ax.Box = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridAlpha = 0.15;
ax.TickLabelInterpreter = 'latex';
xlim(ax, [0, 180]);
ylim(ax, [-1, 0]);
xticks(ax, 0:30:180);
yticks(ax, -1:0.1:0);
xlabel(ax, '$\alpha\;({}^{\circ})$', 'Interpreter', 'latex', ...
    'FontSize', 11.5);
ylabel(ax, '$\lambda$', 'Interpreter', 'latex', ...
    'FontSize', 11.5);
end

function format_legend(legendHandle)
legendHandle.FontSize = 9.5;
end
