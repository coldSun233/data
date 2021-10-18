function W = create_missing_data_pattern(sz, M, varargin)
%this function is used to generate the missing element indicator tensor


% parse inputs
    params = inputParser;
    params.addParameter('dataset', [], @isnumeric);

    data = params.Results.dataset;

    if exist('dataset', 'var')
        data(data < 0) = 0;
        data(dataset > 0) = 1;
        W = dataset;
    else
        W = tt_create_missing_data_pattern(sz, M, 0);
    end
end