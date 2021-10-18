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
    params.addParameter('rCf', @isnumeric);
    params.addParameter('noise', 0.1, @(x) x > 0);

    params.parse(varargin{:});
    sz = params.Results.size; %size of data sets
    lambdas = params.Results.lambdas; % norms of components in each data set
    nlevel = params.Results.noise;
    flag_nn = params.Results.flag_nn; %indicator showing the nonnegative factor matrices
    R = params.Results.R;

    Z = zeros(1);
end
