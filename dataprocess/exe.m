clear;
clc;
addpath('cmtf-ac', 'cmtf_toolbox_v1_2', 'poblano_toolbox_v1_2', 'tensor_toolbox_v3_1');

% modeling user data
mainInfo = generate_mainInfo();
auxInfo = generate_auxInfo();

% set time period
time_period = 6;
T = 6;
% generate trainset and test set
[train_set, test_set] = generate_trainAndTest(mainInfo, time_period, T);

% get UPD
upd = calculate_upd(train_set);
% reconstruct trainset
sz = size(train_set);
userNum = sz(1);
data = train_set;
for n = 1:userNum
    for t = 1:(T-1)
        dec = exp((t-T)*upd(n));
        train_set(n,:,t) = train_set(n,:,t).*dec;
    end
end

% calculate user similarities
similar = calculate_similarities(data);

Z.object = cell(3, 1);
Z.object{1} = tensor(train_set);
Z.object{2} = tensor(auxInfo);
Z.object{3} = tensor(similar);

Z.modes = cell(1,3);
Z.modes{1} = [1,2,3];
Z.modes{2} = [1,4];
Z.modes{3} = [1,5,6];

Z.norms = [1;1;1];

sz1 = size(train_set);
sz2 = size(auxInfo);
sz3 = size(similar);
Z.size = [sz1, sz2(2:end), sz3(2:end)];

Z.miss = cell(3,1);
w1 = zeros(sz1);
w1(train_set ~= 0) = 1;
w2 = ones(sz2);
w3 = ones(sz3);
Z.miss{1} = tensor(w1);
Z.miss{2} = tensor(w2);
Z.miss{3} = tensor(w3);

Z.cpdim = cell(3,1);
Z.cpdim{1} = [2,3];

R = T;
init = 'random';
options = ncg('defaults');
options.Display ='final';
options.MaxFuncEvals = 100000;
options.MaxIters     = 10000;

[Fac, G,out]  = cmtf_opt(Z,R,'init',init,'alg_options',options);

fac = Fac.U;
estimate = full(ktensor(fac(1:3)));
esti_test = double(estimate(:,:,T));

recall = get_recall(esti_test, test_set, 3);
