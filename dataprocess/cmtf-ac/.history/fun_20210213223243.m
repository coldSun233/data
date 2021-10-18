function output = fun(varargin)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
    X(X < 0) = 0;
    X(X > 0) = 1;
    output = X;
end