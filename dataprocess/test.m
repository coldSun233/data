clear;
clc;
addpath("CMTF_Toolbox_v1_1");

% modeling user data
mainInfo = generate_mainInfo();
auxInfo = generate_auxInfo();

% set time period
time_period = 6;
T = 5;
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


Z.object{1} = tensor(train_set);
Z.object{2} = tensor(auxInfo);
Z.size = [6040,18,T,24];
Z.modes = {[1,2,3],[1,4]};

w2 = zeros(size(auxInfo));
w2(auxInfo~=0) = 1;
%w1 = ones(size(train_set));
%temp = train_set(:,:,T);
%temp(temp ~= 0) = 1;
%w1(:,:,T) = temp;
w1 = zeros(size(train_set));
w1(train_set~=0) = 1;

Z.miss{1} = tensor(w1);
%Z.miss{2} = tensor(w2);

R = T;
%init = 'random';
init = 'nvecs';
options = ncg('defaults');
options.Display ='final';
options.MaxFuncEvals = 100000;
options.MaxIters     = 10000;

[Fac, G,out]  = cmtf_opt(Z,R,'init',init,'alg_options',options);

fac = Fac.U;
estimate = full(ktensor(fac(1:3))).*Z.miss{1};
esti_test = double(estimate(:,:,T));

recall = get_recall(esti_test, train_set(:,:,T), 3);

 
