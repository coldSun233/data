
% user = [user_id, genderF, genderM, age, occupation] class=double
users = import_users("./users.txt", [1, Inf]);
userNum = length(users);
attributeNum = 24;
auxInfo = zeros(userNum, attributeNum);
for n = 1:userNum
   % genderInfo
   auxInfo(n, 1) = user(n, 2);
   auxInfo(n, 2) = user(n, 3);
   % ageInfo
   auxInfo(n, 3)
end

