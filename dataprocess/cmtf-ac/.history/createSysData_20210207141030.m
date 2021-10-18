function Z = createSysData(varargin)
% this function is used to generate synthetic data

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
    modes = params.Results.modes; % how the data sets are coupled
    noise = params.Results.noise;
    R = params.Results.Rank;

    if isempty(params.Results.lambdas)
        n = length(modes);
        lambdas = cell(1, n);

        for i = 1:n
            lambdas{i} = ones(1, R);
        end

    else
        lambdas = params.Results.lambdas;
    end

    max_modeid = max(cellfun(@(x) max(x), modes));

    if max_modeid ~= length(sz)
        error('Mismatch between size and modes inputs')
    end

    % Generate factor matrices
    tensorNum = length(modes);
    factors = cell(tensorNum, 1);

    for i = 1:tensorNum
        dim = length(modes{i});
        factors{i} = cell() 
    end

    Z.lambdas = lambdas;
    Z.sz = sz;
    Z.modes = modes;
    Z.noise = noise;
    Z.R = R;
end
