function W = create_missing_data_pattern(size, M, varargin)
%this function is used to generate the indicater tensor

% parse inputs
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('modes', @iscell);

    params.parse(varargin{:});

    
end