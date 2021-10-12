movies = import_movies("./movies.txt", [1, Inf]);
allgenres = get_allgenres(movies(:,2));

% map move name to genre vector
m2g = cell(3952,1);
len = length(movies);
for n = 1:len
   index1 = str2double(movies(n,1));
   m2g{index1} = zeros(1, 18);
   current_genres = strsplit(movies(n, 2), '|');
   len2 = length(current_genres);
   for m = 1:len2
      index2 = find(allgenres == current_genres(m));
      m2g{index1}(index2) = 1;
   end
end

% generate rate tensor
ratings = import_ratings("./ratings.txt", [1, Inf]);
rate_tensor = zeros(6040, 18, 36);
len3 = length(ratings);
for n = 1:len3
   user_id = ratings(n,1);
   movie_id = ratings(n,2);
   time = ratings(n,3);
   rate_tensor(user_id,:,time) = rate_tensor(user_id,:,time) + m2g{movie_id};
end

