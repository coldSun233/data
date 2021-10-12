mainInfo = tensor(generate_mainInfo());
auxInfo = tensor(generate_auxInfo());

[train_set6, test_set6] = generate_trainAndTest(mainInfo, 6, 6);

% get UPD
data = train_set6;
sz = size(data);
userNum = sz(1)