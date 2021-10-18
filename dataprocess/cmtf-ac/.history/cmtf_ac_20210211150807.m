function output = cmtf_ac(Z,R,varargin)
 %
 % Z is a structure with 'size', 'object', 'modes'
    
    if (nargin < 2)
        error('Error: invalid input arguments');
    end

    %% Set parameters
    params = inputParser;
    params.addParameter('alg' , 'ctf_ncg', @(x) ismember(x,{'ctf_ncg','tn','lbfgs','sgd'}));
    params.addParameter('init', 'random', @(x) (iscell(x) || ismember(x,{'random','nvecs'})));
    params.addOptional('alg_options', '', @isstruct);
    params.parse(varargin{:});
end