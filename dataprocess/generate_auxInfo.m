function auxInfo = generate_auxInfo()
    % user = [user_id, genderF, genderM, age, occupation] class=double
    users = import_users("./users.txt", [1, Inf]);
    userNum = length(users);
    attributeNum = 24;
    auxInfo = zeros(userNum, attributeNum);
    for n = 1:userNum
       % occupation
       auxInfo(n, users(n, 5)+1) = 1;
    end
    % genderInfo
    auxInfo(:,22) = users(:,2);
    auxInfo(:,23) = users(:,3);
    % ageInfo
    auxInfo(:,24) = users(:,4);
end

