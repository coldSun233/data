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

tensorNum = length(modes);
factors = cell(tensorNum, 1);
for i = 1:tensorNum
    dim = length(modes{i});
    factors{i} = cell(dim, 1);
    for j = 1:dim
        factors{i}{j} = randi([0, 10], sz(modes{i}(j)), R);
    end
end