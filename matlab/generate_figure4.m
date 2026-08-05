function generate_figure4()
%GENERATE_FIGURE4 Reconstruct Fig. 4 and create a separate D1 audit plot.

projectRoot = fileparts(fileparts(mfilename('fullpath')));
resultsDir = fullfile(projectRoot, 'results');
figuresDir = fullfile(projectRoot, 'figures');
if ~isfolder(figuresDir)
    mkdir(figuresDir);
end

csvPath = fullfile(resultsDir, 'baseline_roots_matlab_1deg.csv');
if isfile(csvPath)
    data = readtable(csvPath);
else
    material = struct('E1', 0.5, 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);
    data = sweep_characteristic_roots((1:179)', material);
    writetable(data, csvPath);
end

% Physical branches. NaN at 90 degrees intentionally breaks the curves.
fig = figure('Color', 'w', 'Position', [100, 100, 780, 520]);
hold on;
plot(data.alpha_deg, data.lambda0, 'Color', [0.45, 0.22, 0.65], ...
    'LineWidth', 1.8, 'DisplayName', '\lambda_0');
plot(data.alpha_deg, data.lambda, 'Color', [0.78, 0.12, 0.12], ...
    'LineWidth', 1.8, 'DisplayName', '\lambda');
plot(data.alpha_deg, data.lambda1, 'Color', [0.10, 0.55, 0.22], ...
    'LineWidth', 1.8, 'DisplayName', '\lambda_1');
plot(data.alpha_deg, data.lambda2, 'Color', [0.05, 0.35, 0.75], ...
    'LineWidth', 1.8, 'DisplayName', '\lambda_2');
xline(90, ':', 'Degenerate limit', 'LabelVerticalAlignment', 'bottom', ...
    'Color', [0.35, 0.35, 0.35], 'HandleVisibility', 'off');
hold off;
format_axes(gca);
legend('Location', 'south', 'NumColumns', 4, 'Box', 'off');
exportgraphics(fig, fullfile(figuresDir, 'figure4_recalculated.pdf'), ...
    'ContentType', 'vector');
exportgraphics(fig, fullfile(figuresDir, 'figure4_recalculated.png'), ...
    'Resolution', 600);
close(fig);

% Keep the manuscript defect outside the publication figure.
fig = figure('Color', 'w', 'Position', [100, 100, 780, 520]);
hold on;
plot(data.alpha_deg, data.lambda1, 'Color', [0.10, 0.55, 0.22], ...
    'LineWidth', 1.8, 'DisplayName', 'Corrected D_1');
plot(data.alpha_deg, data.lambda1_D1_printed, 'k--', ...
    'LineWidth', 1.4, 'DisplayName', 'Printed D_1');
xline(90, ':', 'Degenerate limit', 'LabelVerticalAlignment', 'bottom', ...
    'Color', [0.35, 0.35, 0.35], 'HandleVisibility', 'off');
hold off;
format_axes(gca);
legend('Location', 'southwest', 'Box', 'off');
exportgraphics(fig, fullfile(figuresDir, 'figure4_D1_audit.pdf'), ...
    'ContentType', 'vector');
exportgraphics(fig, fullfile(figuresDir, 'figure4_D1_audit.png'), ...
    'Resolution', 600);
close(fig);

fprintf('Wrote Figure 4 and D1 audit plots to %s.\n', figuresDir);
end

function format_axes(ax)
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
ax.LineWidth = 0.8;
ax.Box = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridAlpha = 0.15;
xlim(ax, [0, 180]);
ylim(ax, [-1, 0]);
xticks(ax, 0:30:180);
yticks(ax, -1:0.1:0);
xlabel(ax, 'Half-angle, \alpha (deg)', 'Interpreter', 'tex');
ylabel(ax, 'Stress-singularity exponent', 'Interpreter', 'tex');
end
