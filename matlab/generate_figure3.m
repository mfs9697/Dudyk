function generate_figure3()
%GENERATE_FIGURE3 Recalculate process-zone parameters versus half-angle.
%
% Outputs:
%   results/figure3_recalculated.csv
%   figures/figure3_recalculated.pdf and .png
%
% The one-degree sweep contains only physically admissible combinations
% selected by C*g2<0 and C*Q_i>0. The degenerate flat-interface value at
% alpha=90 degrees is excluded from the CSV and inserted only as the
% theoretical zero limit of the two adjacent plotted segments. Wiener-Hopf
% contours are extended near 0 and 180 degrees according to the slowest
% exponential kernel tail.

projectRoot = fileparts(fileparts(mfilename('fullpath')));
resultsDir = fullfile(projectRoot, 'results');
figuresDir = fullfile(projectRoot, 'figures');
if ~isfolder(resultsDir)
    mkdir(resultsDir);
end
if ~isfolder(figuresDir)
    mkdir(figuresDir);
end

material = struct('E1', 0.5, 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);
alphaDeg = (1:179)';
rootData = sweep_characteristic_roots(alphaDeg, material);
admissibility = calculate_figure4_admissibility( ...
    rootData.alpha_deg, rootData.lambda0, material);
cases = figure3_case_definitions();

caseMasks = [ ...
    admissibility.C_positive.material2, ...
    admissibility.C_negative.material1, ...
    admissibility.C_negative.material2, ...
    admissibility.C_positive.material1];
physicalRows = alphaDeg ~= 90;
coverage = sum(caseMasks, 2);
if any(coverage(physicalRows) ~= 1) || any(coverage(~physicalRows) ~= 0)
    error('characteristic_roots:Figure3AdmissibilityCoverage', ...
        ['Every nondegenerate angle must select exactly one Figure-3 ', ...
        'load/material case, and 90 degrees must select none.']);
end

calculatedRows = find(physicalRows);
n = numel(calculatedRows);
alphaOut = alphaDeg(calculatedRows);
caseId = strings(n, 1);
materialIndex = nan(n, 1);
sigmaPrime = nan(n, 1);
factorTruncation = nan(n, 1);
dOverL = nan(n, 1);
deltaPrime = nan(n, 1);
JPrime = nan(n, 1);
lambda0 = nan(n, 1);
lambda = nan(n, 1);
g2 = nan(n, 1);
Qprefactor = nan(n, 1);
baseTerminalLogDeviation = nan(n, 1);
processTerminalLogDeviation = nan(n, 1);

for row = 1:n
    sourceRow = calculatedRows(row);
    selectedCase = find(caseMasks(sourceRow, :));
    currentCase = cases(selectedCase);
    alpha = deg2rad(alphaOut(row));
    factorOptions = figure3_factor_options(alpha);
    options = struct('factor_options', factorOptions);
    result = calculate_process_zone_parameters( ...
        alpha, material, currentCase.material_index, ...
        currentCase.sigma_prime, options);

    caseId(row) = string(currentCase.id);
    materialIndex(row) = currentCase.material_index;
    sigmaPrime(row) = currentCase.sigma_prime;
    factorTruncation(row) = factorOptions.truncation;
    dOverL(row) = result.d_over_l;
    deltaPrime(row) = result.delta_prime;
    JPrime(row) = result.J_prime;
    lambda0(row) = result.asymptotic_coefficients.lambda0;
    lambda(row) = result.lambda;
    g2(row) = result.asymptotic_coefficients.g2;
    Qprefactor(row) = result.Q_prefactor;
    baseDiagnostics = ...
        result.asymptotic_coefficients.factor_diagnostics;
    baseTerminalLogDeviation(row) = ...
        baseDiagnostics.terminal_log_deviation;
    processTerminalLogDeviation(row) = ...
        result.factor_diagnostics.terminal_log_deviation;

    if row == 1 || row == n || mod(alphaOut(row), 10) == 0
        fprintf(['Figure 3: alpha=%3.0f deg, material %d, ', ...
            'sigmaPrime=%+.1f, T=%.0f.\n'], alphaOut(row), ...
            materialIndex(row), sigmaPrime(row), factorTruncation(row));
    end
end

data = table(alphaOut, caseId, materialIndex, sigmaPrime, ...
    factorTruncation, dOverL, deltaPrime, JPrime, lambda0, lambda, ...
    g2, Qprefactor, baseTerminalLogDeviation, ...
    processTerminalLogDeviation, ...
    'VariableNames', {'alpha_deg', 'case_id', 'material_index', ...
    'sigma_prime', 'factor_truncation', 'd_over_l', 'delta_prime', ...
    'J_prime', 'lambda0', 'lambda', 'g2', 'Q_prefactor', ...
    'base_terminal_log_deviation', ...
    'process_terminal_log_deviation'});
writetable(data, fullfile(resultsDir, 'figure3_recalculated.csv'));

write_figure(data, cases, figuresDir);

fprintf(['Figure-3 admissibility transitions: alpha1=%.4f deg, ', ...
    'alpha2=%.4f deg.\n'], admissibility.alpha1_deg, ...
    admissibility.alpha2_deg);
fprintf(['Maximum terminal kernel log-deviation: base %.3g, ', ...
    'process %.3g.\n'], max(data.base_terminal_log_deviation), ...
    max(data.process_terminal_log_deviation));
fprintf('Wrote the Figure-3 CSV and plots to %s and %s.\n', ...
    resultsDir, figuresDir);
fprintf(['Run run_figure3_tests to reproduce the author T=40 table ', ...
    'separately and verify convergence of the scientific sweep.\n']);
end

function write_figure(data, cases, figuresDir)
% Compact 3:1 canvas keeps the full three-panel angular sweep readable
% without allowing the legend to dominate the manuscript page.
fig = figure('Color', 'w', 'Position', [100, 100, 900, 300]);
layout = tiledlayout(fig, 1, 3, 'TileSpacing', 'compact', ...
    'Padding', 'compact');
yFields = {'d_over_l', 'delta_prime', 'J_prime'};
yLabels = {'$d_i/l$', '$\delta_i^{\prime}$', '$J_i^{\prime}$'};
yMaximum = [0.25, 0.25, 0.06];
panelLabels = {'(a)', '(b)', '(c)'};
legendHandles = gobjects(1, numel(cases));
legendLabels = figure3_legend_labels(cases);

for panel = 1:3
    ax = nexttile(layout);
    hold(ax, 'on');
    for k = 1:numel(cases)
        mask = data.case_id == string(cases(k).id);
        segmentAlpha = data.alpha_deg(mask);
        segmentValues = data.(yFields{panel})(mask);

        % Both branches adjacent to the flat-interface limit tend to zero.
        % This point is plotted as an analytic limit, not stored as a
        % calculated row in the CSV.
        if strcmp(cases(k).id, 'C_negative_material1') || ...
                strcmp(cases(k).id, 'C_negative_material2')
            segmentAlpha(end + 1, 1) = 90; %#ok<AGROW>
            segmentValues(end + 1, 1) = 0; %#ok<AGROW>
            [segmentAlpha, order] = sort(segmentAlpha);
            segmentValues = segmentValues(order);
        end

        handle = plot(ax, segmentAlpha, segmentValues, ...
            cases(k).line_style, 'Color', cases(k).color, ...
            'LineWidth', 1.8);
        if panel == 1
            legendHandles(k) = handle;
        end
    end
    hold(ax, 'off');
    format_axes(ax, yLabels{panel}, yMaximum(panel), panel);
    title(ax, panelLabels{panel}, 'Interpreter', 'latex', ...
        'FontSize', 11, 'FontWeight', 'normal');
end

% MATLAB fills a multi-column legend column-wise. This sequence preserves
% the manuscript's visual row order: +m2, -m1, -m2, then +m1.
legendOrder = [1, 3, 2, 4];
legendHandle = legend(legendHandles(legendOrder), ...
    legendLabels(legendOrder), ...
    'Interpreter', 'latex', 'NumColumns', 2, 'Box', 'off');
legendHandle.FontSize = 9.5;
legendHandle.Layout.Tile = 'south';
export_with_fallback(fig, ...
    fullfile(figuresDir, 'figure3_recalculated.pdf'), ...
    'ContentType', 'vector');
export_with_fallback(fig, ...
    fullfile(figuresDir, 'figure3_recalculated.png'), ...
    'Resolution', 600);
close(fig);
end

function format_axes(ax, yLabelText, yMaximum, panel)
ax.FontName = 'Times New Roman';
ax.FontSize = 10.5;
ax.LineWidth = 0.8;
ax.Box = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridAlpha = 0.15;
ax.TickLabelInterpreter = 'latex';
xlim(ax, [0, 180]);
ylim(ax, [0, yMaximum]);
xticks(ax, 0:30:180);
if panel < 3
    yticks(ax, 0:0.05:yMaximum);
else
    yticks(ax, 0:0.01:yMaximum);
end
xlabel(ax, '$\alpha\;({}^{\circ})$', 'Interpreter', 'latex', ...
    'FontSize', 11.5);
ylabel(ax, yLabelText, 'Interpreter', 'latex', ...
    'FontSize', 11.5);
end

function labels = figure3_legend_labels(cases)
labels = cell(1, numel(cases));
for k = 1:numel(cases)
    if cases(k).sigma_prime > 0
        signText = '>';
    else
        signText = '<';
    end
    labels{k} = sprintf( ...
        '$\\sigma^{\\prime}=%+.1f,\\;C%s0,\\;i=%d$', ...
        cases(k).sigma_prime, signText, cases(k).material_index);
end
end

function export_with_fallback(fig, destination, varargin)
try
    exportgraphics(fig, destination, varargin{:});
catch exception
    [folder, stem, extension] = fileparts(destination);
    fallback = fullfile(folder, [stem, '_new', extension]);
    warning('characteristic_roots:FigureFileLocked', ...
        ['Could not overwrite %s (%s). Writing %s instead. Close the ', ...
        'open PDF or image before the next run.'], ...
        destination, exception.message, fallback);
    exportgraphics(fig, fallback, varargin{:});
end
end
