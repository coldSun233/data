function Z = createSysData(varargin)
    % generate synthetic data
    params = inputParser;
    params.addParamValue('size', @isnumeric);
    params.addParamValue('lambdas', @iscell);
    params.addParamValue('rRank', @isnumeric);
    params.addParamValue('rCf', @isnumeric);
    params.addParamValue('noise', @(x) x > 0);

    params.parse(varargin{:});
end
