function Z = createSysData(varargin)
    % this function is used to generate synthetic data
    if ~exist('lambdas', 'var')

    end

    % Parse inputs
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('modes', @iscell);
    params.addParameter('lambdas', cell(0), @iscell);
    params.addParameter('Rank', 3, @isnumeric);
    % params.addParameter('rCf', @isnumeric);
    params.addParameter('noise', 0.1, @(x) x > 0);

    params.parse(varargin{:});
    sz = params.Results.size; %size of data sets
    modes = params.Results.modes;
    lambdas = params.Results.lambdas; % norms of components in each data set
    noise = params.Results.noise;
    R = params.Results.Rank;
    if isempty(sys)

    max_modeid = max(cellfun(@(x) max(x), modes));
    if max_modeid ~= length(sz)
        error('Mismatch between size and modes inputs')
    end

    Z.lambdas = lambdas;
    Z.sz = sz;
    Z.modes = modes;
    Z.noise = noise;
    Z.R = R;
end
