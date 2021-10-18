g = 1:130;
R = 5;
G = cell(3, 1);
G{1} = cell(3, 1);
G{2} = cell(2, 1);
G{3} = cell(3, 1);
G{1}{1} = reshape(g(1:15), 3, 5);
G{1}{2} = reshape(g(16:15), 4, 5);
G{1}{3} = reshape(g(1:15), 5, 5);
G{2}{1} = reshape(g(1:15), 3, 5);
G{2}{2} = reshape(g(1:15), 3, 5);
G{3}{1} = reshape(g(1:15), 3, 5);
G{3}{2} = reshape(g(1:15), 3, 5);
G{3}{3} = reshape(g(1:15), 2, 5);
3 4 5  3 3   3 3 2