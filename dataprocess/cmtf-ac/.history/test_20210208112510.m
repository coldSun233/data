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
targetTensorDim = length(modes{1});
coupledDim = cell(targetTensorDim, 1);
for n = 1:targetTensorDim
    for m = 2:tensorNum
        len = length(modes{m});
        if n <= len && modes{m}(n) == modes{1}(n)
            if 
            coupledDim{n} = [coupledDim{n}, m];
        end
    end
end