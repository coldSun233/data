function recall = get_recall(estimat, real, topK)
    sz = size(real);
    userNum = sz(1);
    itemNum = sz(2);
    hitNum = 0;
    allNum = 0;
    for n = 1:userNum
        if any(real(n,:))
            [a, index1] = sort(estimat(n,:));
            % [b, index2] = sort(real(n,:));
            estimat_topK = index1((itemNum - topK + 1):itemNum);
            current_useritem = find(real(n,:)~=0);
            hitNum = hitNum + numel(intersect(estimat_topK, current_useritem));
            allNum = allNum + numel(current_useritem);
        end
    end
    recall = hitNum / allNum;
end

