function W = create_missing_data_pattern(sz, M, varargin)
%this function is used to generate the missing element indicator tensor


% parse inputs
    params = inputParser;
    params.addParameter('data', [], @isnumeric);

    params.parse(varargin{:});
    data = params.Results.data;

    if exist('dataset', 'var')
        data(data < 0) = 0;
        data(data > 0) = 1;
        W = data;
    else
        %W = tt_create_missing_data_pattern(sz, M, 0);
        fprintf(fileID, formatSpec, A1_AN)
    end
end