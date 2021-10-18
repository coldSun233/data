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
        case 'ncg'
            fhandle = @ncg
    case 'sgd'
        fhandle = @sgdUpdate;
    case 'cmtf_ncg'
        fhandle = @cmtf_ncg;
    case 'tn'
        fhandle = @tn;
    case 'lbfgs'
        fhandle = @lbfgs;
    end
end