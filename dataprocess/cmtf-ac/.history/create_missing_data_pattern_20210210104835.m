function W = create_missing_data_pattern(sz, M, varargin)
%this function is used to generate the missing element indicator tensor


% parse inputs
    params = inputParser;
    params.addParameter('size', [], @isnumeric);
    params.addParameter('M', 0, @(x) x >= 0 && x <= 1)
    params.addParameter('data', [], @isnumeric);

    params.parse(varargin{:});
    sz = params.Results.size;
    M = params.Results.M;
    data = params.Results.data;

    if exist('data', 'var')
        data(data < 0) = 0;
        data(data > 0) = 1;
        W = data;
    else
        if isempty(sz)
            error('the parameter""")
        end

        W = tt_create_missing_data_pattern(sz, M, false);
    end
end