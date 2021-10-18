clear;
clc;
addpath('cmtf_toolbox_v1_2', 'poblano_toolbox_v1_2', 'tensor_toolbox_v3_1');

% parameters
sz = [30, 40, 50, 30, 30, 10];
modes = {[1, 2, 3], [1, 4], [1, 5, 6]};
Rank = 30;
P = length(modes);
lambdas = cell(1, P);

for i = 1:P
    lambdas{i} = ones(1, Rank);
end

noise = 0.1;

Z1 = createSysData('size', sz, 'modes', modes, 'lambdas', lambdas, 'noise', noise, 'Rank', Rank);

Z2 = createSysData('size', sz, 'modes', modes);

Z3 = createSysData('size', sz, 'modes', {[1, 2, 3], [1, 4]}, 'lambdas', lambdas, 'noise', noise, 'Rank', Rank);

