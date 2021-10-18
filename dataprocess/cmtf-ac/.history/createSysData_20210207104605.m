function Z = createSysData(varargin)
    % this function is used to generate synthetic data
    if ~exist('lambdas', 'var')

    end

    % Parse inputs
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('modes', @iscell);
    params.addParameter('lambdas', @iscell);
    params.addParameter('Rank', 3, @isnumeric);
    % params.addParameter('rCf', @isnumeric);
    params.addParameter('noise', 0.1, @(x) x > 0);

    params.parse(varargin{:});
    sz = params.Results.size; %size of data sets
    modes = params.Results.modes;
    lambdas = params.Results.lambdas; % norms of components in each data set
    noise = params.Results.noise;
    R = params.Results.Rank;

    Z.lambdas = lambdas;
    Z.sz = sz;
    
end
