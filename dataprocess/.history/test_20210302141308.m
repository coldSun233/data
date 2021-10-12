mainInfo = tensor(generate_mainInfo());
auxInfo = tensor(generate_auxInfo());

[train_set6, test_set6] = generate_trainAndTest(mainInfo, 6, 6);

% get UPD
data = train_set6;

sz = size(data);
userNum = sz(1);
upd = zeros(userNum, 1);
T = sz(3);
if T = 1
   upd = zeros(userNum, 1);
   prev = double(collapse(tensor(data(:,:,1:(T-1))), 3));
   cur = data(:,:,T);
   pre_interact = cell(userNum, 1);
   cur_interact = cell(userNum, 1);
   for n = 1:userNum
      prev_interact = find(prev(n,:)~=0);
      cur_interact = find(cur(n,:)~=0);
      if isempty(cur_interact)
         upd(n) = 1;
      else
         common = numel(intersect(prev_interact, cur_interact));
         upd(n) = 1 - common / (numel(prev_interact) + numel(cur_interact) - common);
      end
   end
end
