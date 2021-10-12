%output = import_mainInfo("/home/lengyang/data/lastfm-dataset-1K/userid-timestamp-artid-artname-traid-traname.tsv", [1, Inf]);
sz = size(main_info);

users = string([]);
userEvent = containers.Map;
for n = 1:sz
    user = main_info(n, 1);
   if ~isKey(userEvent, user)
      users = [users; user]; 
      userEvent(user) = double(1);
   else
       userEvent(user) = userEvent(user) + 1;
   end
end
index = 1:numel(users);
userid2index = containers.Map(users, index);

artists = string([]);
artistsNum = containers.Map;
for m = 1:sz
    artist = main_info(m, 3);
    if ~isKey(artistsNum, artist)
        artists = [artists; artist];
        artistsNum(artist) = double(1);
    else
        artistsNum(artist) = artistsNum(artist) + 1;
    end       
end

name = keys(artistsNum);
value = values(artistsNum);
[a, index1] = sort(value);
top700_value = a((end - 699):end);
top700_value_index = index((end-699):end);


