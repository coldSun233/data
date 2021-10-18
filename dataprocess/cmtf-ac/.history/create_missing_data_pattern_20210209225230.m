function W = create_missing_data_pattern(size, M, varargin)
%this function is used to generate the missing element indicator tensor

% parse inputs
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('M', @iscell);

    params.parse(varargin{:});

    
end