function W = create_missing_data_pattern(sz, M, varargin)
%this function is used to generate the missing element indicator tensor


% parse inputs
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('M', 0,  @(x) x >= 0 && x <= 1);
    params.addParameter('dataset', [], @isnumeric);

    params.parse(varargin{:});
    sz = params.Results.size; %size of data sets
    modes = params.Results.modes; % how the data sets are coupled
    noise = params.Results.noise;
    
    if exist('dataset', 'var')
        sz = size(dataset);
    else
        W = tt_create_missing_data_pattern(sz, M, 0);
    end
end