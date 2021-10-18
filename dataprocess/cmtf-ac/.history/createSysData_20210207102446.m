function Z = createSysData(varargin)
% this function is used to generate synthetic data
    
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('lambdas', @iscell);
    params.addParameter('rRank', @isnumeric);
    params.addParameter('rCf', @isnumeric);
    params.addParameter('noise', @(x) x > 0);

    params.parse(varargin{:});
end
