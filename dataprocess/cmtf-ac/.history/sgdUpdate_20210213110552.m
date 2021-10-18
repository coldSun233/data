function out  =  sgdUpdate(FUN,x0,varargin)

    % Create parser
    params = inputParser;
    
    % Set Poblano parameters
    params.addParamValue('Display','iter', @(x) ismember(x,{'iter','final','off'}));
    params.addParamValue('DisplayIters', 1, @(x) x >= 1);
    params.addParamValue('MaxIters', 1000, @(x) x >= 0);
    params.addParamValue('RelFuncTol', 1e-6, @isnumeric);
    params.addParamValue('num', 2, @(x) x >= 0);
    params = setparam(params);
    
    % Parse input
    params.parse(varargin{:});
    
    %% Check input arguments
    if (nargin == 1) && isequal(FUN,'defaults') && (nargout == 1)
        out = params.Results;
        return;
    elseif (nargin < 2)
        error('Error: invalid input arguments');
    end
    
    omega  =0.4;
    xk = x0;
    [fk,gk] = feval(FUN,xk);
    
    out = conver(xk,fk,params);
    oldf = fk;
    while out.ExitFlag == -1
        xk = xk - omega * gk;
        [fk,gk] = feval(FUN,xk);
        
        relfit = abs((fk - oldf)/oldf);
        oldf = fk;
        if relfit<10e-3
            omega = omega/2;
        end
        out = conver(xk,fk,params,out);    
    end
end    