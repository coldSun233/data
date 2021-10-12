clear;
clc;
addpath("CMTF_Toolbox_v1_1");
mainInfo = generate_mainInfo();
%mainInfo = rate_tensor;
auxInfo = generate_auxInfo();

time_period = 6;
T = 5;
[train_set, test_set] = generate_trainAndTest(mainInfo, time_period, T);

% get UPD
upd = calculate_upd(train_set);
sf = 1-upd;
sz = size(train_set);
userNum = sz(1);
data = train_set;
for n = 1:userNum
   train_set(n,:,1:(T-1)) = train_set(n,:,1:(T-1)).*sf(n);
end

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


 