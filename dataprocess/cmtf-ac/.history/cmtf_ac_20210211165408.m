function output = cmtf_ac(Z,R,varargin)
 %
 % Z is a structure with 'size', 'object', 'modes'
    
    if (nargin < 2)
        error('Error: invalid input arguments');
    end

    %% Set parameters
    params = inputParser;
    params.addParameter('alg' , 'cmtf_ncg', @(x) ismember(x,{'cmtf_ncg','ncg','tn','lbfgs','sgd'}));
    params.addParameter('init', 'random', @(x) (iscell(x) || ismember(x,{'random','nvecs'})));
    params.addOptional('alg_options', '', @isstruct);
    params.parse(varargin{:});

    %% Set up optimization algorithm
    switch (params.Results.alg)
        case 'sgd'
            fhandle = @sgdUpdate;
        case 'cmtf_ncg'
            fhandle = @cmtf_ncg;
        case 'ncg'
            fhandle = @ncg;
        case 'tn'
            fhandle = @tn;
        case 'lbfgs'
            fhandle = @lbfgs;
    end

    %% Set up optimization algorithm options
    if isempty(params.Results.alg_options)
        options = feval(fhandle, 'defaults');
    else
        options = params.Results.alg_options;
    end

    sz = Z.size;
    tensorNum = length(Z.modes);

    if iscell(params.Results.init)
        G = params.Results.init;
    elseif strcmpi(params.Results.init,'random')
        G = cell(tensorNum,1);
        for n = 1:tensorNum
            dim = length(Z.modes{n});
            G{n} = cell(dim, 1);
            for t = 1:dim
                G{n}{t} = randn(sz(Z.modes{n}(t), R));
                for m = 1:R
                    G{n}{t}()
            end
        end
    elseif strcmpi(params.Results.init,'nvecs')
        G = cell(N,1);
        for n=1:N
            G{n} = cmtf_nvecs(Z,n,R);
        end
    else
        error('Initialization type not supported')
    end
    
end