function generate_figure2()
%GENERATE_FIGURE2 Recalculate all four process-zone cases in Figure 2.
%
% Outputs:
%   results/figure2_recalculated.csv
%   figures/figure2_recalculated.pdf and .png
%   figures/figure2_original_window.pdf and .png
%
% The first figure uses limits large enough to show every calculated curve.
% The second uses the original manuscript's plotting window for direct
% visual comparison.  The two files contain the same numerical results.

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
cases = figure2_case_definitions();
factorOptions = struct('truncation', 60, ...
    'relative_tolerance', 1e-10, 'absolute_tolerance', 1e-12);
options = struct('factor_options', factorOptions);

caseData = cell(size(cases));
combined = table();
for k = 1:numel(cases)
    sigmaPrime = linspace(cases(k).sigma_min, ...
        cases(k).sigma_max, 201)';
    result = calculate_process_zone_parameters( ...
        deg2rad(cases(k).alpha_deg), material, ...
        cases(k).material_index, sigmaPrime, options);

    rowCount = numel(sigmaPrime);
    caseData{k} = table(result.sigma_prime(:), result.d_over_l(:), ...
        result.delta_prime(:), result.J_prime(:), 'VariableNames', ...
        {'sigma_prime', 'd_over_l', 'delta_prime', 'J_prime'});
    caseTable = table( ...
        repmat(string(cases(k).id), rowCount, 1), ...
        repmat(cases(k).alpha_deg, rowCount, 1), ...
        repmat(cases(k).material_index, rowCount, 1), ...
        caseData{k}.sigma_prime, caseData{k}.d_over_l, ...
        caseData{k}.delta_prime, caseData{k}.J_prime, ...
        'VariableNames', {'case_id', 'alpha_deg', 'material_index', ...
        'sigma_prime', 'd_over_l', 'delta_prime', 'J_prime'});
    if k == 1
        combined = caseTable;
    else
        combined = [combined; caseTable]; %#ok<AGROW>
    end

    endpoint = calculate_process_zone_parameters( ...
        deg2rad(cases(k).alpha_deg), material, ...
        cases(k).material_index, cases(k).sigma_max, options);
    if cases(k).sigma_max == 0
        endpoint = calculate_process_zone_parameters( ...
            deg2rad(cases(k).alpha_deg), material, ...
            cases(k).material_index, cases(k).sigma_min, options);
    end
    fprintf(['alpha=%3.0f deg, material %d, sigmaPrime=%+.1f: ', ...
        'd/l=%.9f, deltaPrime=%.9f, JPrime=%.9f.\n'], ...
        cases(k).alpha_deg, cases(k).material_index, ...
        endpoint.sigma_prime, endpoint.d_over_l, ...
        endpoint.delta_prime, endpoint.J_prime);
end
writetable(combined, fullfile(resultsDir, 'figure2_recalculated.csv'));

% The complete view prevents the 45-degree curve and the printed-equation
% 10-degree opening/energy curves from being hidden by the manuscript crop.
write_figure(caseData, cases, [0.16, 0.16, 0.04], ...
    figuresDir, 'figure2_recalculated');

% These limits approximate the original Figure-2 panels and make visual
% comparison possible without changing or clipping the stored CSV values.
write_figure(caseData, cases, [0.10, 0.10, 0.03], ...
    figuresDir, 'figure2_original_window');

fprintf('Wrote all four Figure-2 cases to %s and %s.\n', ...
    resultsDir, figuresDir);
fprintf(['Author-validation note: the author confirmed that an indexing ', ...
    'error in the original material-2 program affected the alpha=10-degree ', ...
    'opening and energy curves. The corrected MATLAB values agree with the ', ...
    'corrected Mathcad calculation; see ', ...
    'docs/AUTHOR_VALIDATION_2026-08-18.md.\n']);
end

function write_figure(caseData, cases, yMaximum, figuresDir, stem)
fig = figure('Color', 'w', 'Position', [100, 100, 1180, 440]);
layout = tiledlayout(fig, 1, 3, 'TileSpacing', 'compact', ...
    'Padding', 'compact');
yFields = {'d_over_l', 'delta_prime', 'J_prime'};
yLabels = {'d_i/l', '\delta_i^{\prime}', 'J_i^{\prime}'};
panelLabels = {'(a)', '(b)', '(c)'};
legendHandles = gobjects(1, numel(cases));

for panel = 1:3
    ax = nexttile(layout);
    hold(ax, 'on');
    for k = 1:numel(cases)
        handle = plot(ax, caseData{k}.sigma_prime, ...
            caseData{k}.(yFields{panel}), cases(k).line_style, ...
            'Color', cases(k).color, 'LineWidth', 2.2, ...
            'DisplayName', cases(k).display_name);
        if panel == 1
            legendHandles(k) = handle;
        end
    end
    hold(ax, 'off');
    format_axes(ax, yLabels{panel}, yMaximum(panel));
    title(ax, panelLabels{panel}, 'FontName', 'Times New Roman', ...
        'FontSize', 12, 'FontWeight', 'normal');
end

% MATLAB fills a multi-column legend column-wise. This index sequence makes
% the visual row order match the manuscript: 45, 10, 105, then 135 degrees.
legendOrder = [2, 3, 1, 4];
legendHandle = legend(legendHandles(legendOrder), ...
    {cases(legendOrder).display_name}, ...
    'Interpreter', 'tex', 'NumColumns', 2, 'Box', 'off');
legendHandle.FontName = 'Times New Roman';
legendHandle.FontSize = 11;
legendHandle.Layout.Tile = 'south';
export_with_fallback(fig, fullfile(figuresDir, [stem, '.pdf']), ...
    'ContentType', 'vector');
export_with_fallback(fig, fullfile(figuresDir, [stem, '.png']), ...
    'Resolution', 600);
close(fig);
end

function format_axes(ax, yLabelText, yMaximum)
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
ax.LineWidth = 0.9;
ax.Box = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridAlpha = 0.15;
ax.TickLabelInterpreter = 'tex';
xlim(ax, [-0.5, 0.5]);
ylim(ax, [0, yMaximum]);
xticks(ax, -0.5:0.25:0.5);
xlabel(ax, '\sigma^{\prime}', 'Interpreter', 'tex', ...
    'FontName', 'Times New Roman', 'FontSize', 13);
ylabel(ax, yLabelText, 'Interpreter', 'tex', ...
    'FontName', 'Times New Roman', 'FontSize', 13);
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
