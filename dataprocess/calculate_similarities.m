function similarities = calculate_similarities(data)    
    w = 3;
    sz = size(data);
    T = sz(3);
    userNum = sz(1);
    similarities = ones(userNum,userNum,T);
    for i = 1:userNum
        for j = 1:userNum
           if i ~= j
                for t = 1:T
                   user_i = data(i,:,t);
                   user_j = data(j,:,t);
                   same_item = [];
                   for m = 1:numel(user_i)
                       if user_i(m) ~= 0 && user_j(m) ~= 0
                          same_item = [same_item, m]; 
                       end
                   end
                   same_num = numel(same_item);
                   
                   if same_num == 0
                       similarities(i,j,t) = 0;
                   else
                       sum1 = 0;
                       sum2 = 0;
                       sum3 = 0;
                       for n = 1:same_num
                           index = same_item(n);
                           sum1 = sum1 + data(i,index,t)*data(j,index,t);
                           sum2 = sum2 + data(i,index,t)*data(i,index,t);
                           sum3 = sum3 + data(j,index,t)*data(j,index,t);
                       end
                       
                       similarities(i,j,t) = sum1/(sum2^0.5 * sum3^0.5);
                       if same_num < w
                           similarities(i,j,t) = similarities(i,j,t)*same_num/w;
                       end
                   end
                end
           end
        end
    end
end