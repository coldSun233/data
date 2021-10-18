function W = create_missing_data_pattern(size, M, varargin)
%this function is used to generate the indicater tensor

% parse inputs
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('modes', @iscell);
    params.addParameter('lambdas', cell(0), @iscell);
    params.addParameter('Rank', 3, @(x) x > 0);
    params.addParameter('noise', 0.1, @(x) x > 0);

    params.parse(varargin{:});

    
end