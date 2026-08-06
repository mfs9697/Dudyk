function generate_figure2_45deg_calibration()
%GENERATE_FIGURE2_45DEG_CALIBRATION Recalculate the solid blue Fig. 2 case.
%
% Baseline: alpha=45 degrees, C<0, process zone in material 1.

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
sigmaPrime = linspace(-0.5, 0, 201)';
result = calculate_process_zone_parameters( ...
    deg2rad(45), material, 1, sigmaPrime);

data = table(result.sigma_prime, result.d_over_l, ...
    result.delta_prime, result.J_prime, 'VariableNames', ...
    {'sigma_prime', 'd_over_l', 'delta_prime', 'J_prime'});
writetable(data, fullfile(resultsDir, ...
    'figure2_45deg_calibration.csv'));

fig = figure('Color', 'w', 'Position', [100, 100, 1120, 380]);
quantities = {data.d_over_l, data.delta_prime, data.J_prime};
yLabels = {'d_1/l', '\delta_1^{\prime}', 'J_1^{\prime}'};
panelLabels = {'(a)', '(b)', '(c)'};
for k = 1:3
    ax = subplot(1, 3, k);
    plot(ax, data.sigma_prime, quantities{k}, '-', ...
        'Color', [0.05, 0.38, 0.78], 'LineWidth', 2.0);
    format_axes(ax, yLabels{k});
    title(ax, panelLabels{k}, 'FontWeight', 'normal');
end
sgtitle('\alpha=45^{\circ}, C<0, material 1', ...
    'FontName', 'Times New Roman', 'FontWeight', 'normal');

exportgraphics(fig, fullfile(figuresDir, ...
    'figure2_45deg_calibration.pdf'), 'ContentType', 'vector');
exportgraphics(fig, fullfile(figuresDir, ...
    'figure2_45deg_calibration.png'), 'Resolution', 600);
close(fig);

checkpoint = calculate_process_zone_parameters( ...
    deg2rad(45), material, 1, -0.5);
fprintf(['45-degree checkpoint at sigmaPrime=-0.5: d1/l=%.9f, ', ...
    'delta1Prime=%.9f, J1Prime=%.9f.\n'], checkpoint.d_over_l, ...
    checkpoint.delta_prime, checkpoint.J_prime);
fprintf('Wrote the calibration CSV to %s and plot to %s.\n', ...
    resultsDir, figuresDir);
end

function format_axes(ax, yLabelText)
ax.FontName = 'Times New Roman';
ax.FontSize = 11;
ax.LineWidth = 0.8;
ax.Box = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridAlpha = 0.15;
xlim(ax, [-0.5, 0]);
xlabel(ax, '\sigma^{\prime}', 'Interpreter', 'tex');
ylabel(ax, yLabelText, 'Interpreter', 'tex');
end
