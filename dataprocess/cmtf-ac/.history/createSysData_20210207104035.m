function Z = createSysData(varargin)
% this function is used to generate synthetic data
if ~exist('lambdas','var')
        
end

    % Parse inputs
    params = inputParser;
    params.addParameter('size', @isnumeric);
    params.addParameter('lambdas', @iscell);
    params.addParameter('Rank', 3, @isnumeric);
    params.addParameter('rCf', @isnumeric);
    params.addParameter('noise', 0.1, @(x) x > 0);
    params.parse(varargin{:});

    Z = zeros(1);
end
