function W = create_missing_data_pattern(sz, M, varargin)
%this function is used to generate the missing element indicator tensor

    if exist('dataset', 'var')
        fprintf('success');
    else
        W = tt_create_missing_data_pattern(sz, M, 0);
    end
    W = 0;
end