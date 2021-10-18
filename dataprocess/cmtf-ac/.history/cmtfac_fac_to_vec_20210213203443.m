function x = cmtfac_fac_to_vec(A)
%this function Converts a set of factor matrices to a vector.

    N = length(A);
    R = size(A{1}{1},2);

    %% Create x
    all_dimsz = [];
    for n = 1:N
        for n = 1:length(A{})
    end


    % xi = cell(N, 1);
    % for t = 1:N
    %     dim = length(A{t});
    %     sz = zeros(dim, 1);
    %     for m = 1:dim
    %         sz(m) = size(A{t}{m}, 1);
    %     end
    %     P = sum(sz) * R;
    %     xi{t} = zeros(P, 1);
    %     for n = 1:dim
    %         idx1 = sum(sz(1:n-1)) * R + 1;
    %         idx2 = sum(sz(1:n)) * R;
    %         xi{t}(idx1:idx2) = reshape(A{t}{n}, sz(n)*R, 1);
    %     end
    % end
    % x = [];
    % for n = 1:N
    %     x =[x; xi{t}];
    % end
end