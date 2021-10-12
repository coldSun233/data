%ratings = import_ratings("./ratings.txt", [1, Inf]);
movies = import_movies("./movies.txt", [1, Inf]);
allgenres = get_genres(movies(:,2));

m2c = ceil(3952,1);
len = length(movies);
for n = 1:len
   index1 = str2double(movies(n,1));
   m2c{index1} = zeros(1, 18);
   current_genres = strsplit(movies(n, 2), '|');
   len2 = length(current_genres);
   for m = 1:len2
      index2 = find(allgenres == current_genres(m));
      m2c{index1}(index2) = 1;
   end
end