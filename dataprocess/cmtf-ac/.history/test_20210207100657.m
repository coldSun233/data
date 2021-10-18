clear;
clc;
addpath('cmtf_toolbox_v1_2', 'poblano_toolbox_v1_2', 'tensor_toolbox_v3_1');

% parameters
sz = [30, 40, 50, 30, 30, 30, 30, 10];
modes = {[1, 2, 3], [4, 5], [6, 7, 8]};
Rank = 30;
P = length(modes);
lambda = cell(1, P);
for i = 1:P
    lambda{i} = ones(1, Rank);
end

