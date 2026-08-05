%GENERATE_BASELINE_SWEEP Recalculate the Figure-4 baseline and write CSV.

clear;
material = struct('E1', 0.5, 'E2', 1.0, 'nu1', 0.3, 'nu2', 0.3);
results = sweep_characteristic_roots((1:179)', material);

outputDir = fullfile(fileparts(fileparts(mfilename('fullpath'))), 'results');
if ~isfolder(outputDir)
    mkdir(outputDir);
end
outputPath = fullfile(outputDir, 'baseline_roots_matlab_1deg.csv');
writetable(results, outputPath);
fprintf('Wrote %d angle rows to %s.\n', height(results), outputPath);
