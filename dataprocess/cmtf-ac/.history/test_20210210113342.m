clear;
clc;
addpath('cmtf_toolbox_v1_2', 'poblano_toolbox_v1_2', 'tensor_toolbox_v3_1');

% parameters
sz = [30, 40, 50, 30, 30, 10];
modes = {[1, 2, 3], [1, 4], [1, 5, 6]};
R = 30;
P = length(modes);
lambdas = cell(1, P);
for i = 1:P
    lambdas{i} = ones(1, R);
end
noise = 0.1;
M = [0.5, 0.5, 0.5];

X = createSysData('size', sz, 'modes', modes, 'lambdas', lambdas, 'Rank', R, 'noise', noise);

datasetNum = length(X.data);
W = cell(datasetNum, 1);
for i = 1:datasetNum
    W{i} = create_missing_data_pattern('size');
end
