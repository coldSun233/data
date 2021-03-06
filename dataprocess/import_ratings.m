function ratings1 = import_ratings(filename, dataLines)
%IMPORTFILE 从文本文件中导入数据
%  RATINGS1 = IMPORTFILE(FILENAME)读取文本文件 FILENAME 中默认选定范围的数据。  返回数值数据。
%
%  RATINGS1 = IMPORTFILE(FILE, DATALINES)按指定行间隔读取文本文件 FILENAME
%  中的数据。对于不连续的行间隔，请将 DATALINES 指定为正整数标量或 N×2 正整数标量数组。
%
%  示例:
%  ratings1 = import_ratings("D:\Code\MATLAB\dataprocess\ratings.txt", [1, Inf]);
%
%  另请参阅 READTABLE。
%
% 由 MATLAB 于 2021-02-28 09:31:31 自动生成

%% 输入处理

% 如果不指定 dataLines，请定义默认范围
if nargin < 2
    dataLines = [1, Inf];
end

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 4);

% 指定范围和分隔符
opts.DataLines = dataLines;
opts.Delimiter = ":";

% 指定列名称和类型
opts.VariableNames = ["VarName1", "VarName2", "Var3", "VarName4"];
opts.SelectedVariableNames = ["VarName1", "VarName2", "VarName4"];
opts.VariableTypes = ["double", "double", "string", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 指定变量属性
opts = setvaropts(opts, "Var3", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Var3", "EmptyFieldRule", "auto");

% 导入数据
ratings1 = readtable(filename, opts);

%% 转换为输出类型
ratings1 = table2array(ratings1);
end