function Z = createSysData(varargin)
    % this function is used to generate synthetic data
    params = inputParser;
    params.addParame('size', @isnumeric);
    params.addParamValue('lambdas', @iscell);
    params.addParamValue('rRank', @isnumeric);
    params.addParamValue('rCf', @isnumeric);
    params.addParamValue('noise', @(x) x > 0);

    params.parse(varargin{:});
end
