function output = import_mainInfo(filename, dataLines)
%IMPORTFILE 从文本文件中导入数据
%  USERIDTIMESTAMPARTIDARTNAMETRAIDTRANAME = IMPORTFILE(FILENAME)读取文本文件
%  FILENAME 中默认选定范围的数据。  以表形式返回数据。
%
%  USERIDTIMESTAMPARTIDARTNAMETRAIDTRANAME = IMPORTFILE(FILE,
%  DATALINES)按指定行间隔读取文本文件 FILENAME 中的数据。对于不连续的行间隔，请将 DATALINES 指定为正整数标量或
%  N×2 正整数标量数组。
%
%  示例:
%  useridtimestampartidartnametraidtraname = importfile("/home/lengyang/data/lastfm-dataset-1K/userid-timestamp-artid-artname-traid-traname.tsv", [1, Inf]);
%
%  另请参阅 READTABLE。
%
% 由 MATLAB 于 2021-03-04 18:10:56 自动生成

%% 输入处理

% 如果不指定 dataLines，请定义默认范围
if nargin < 2
    dataLines = [1, Inf];
end

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 6);

% 指定范围和分隔符
opts.DataLines = dataLines;
opts.Delimiter = "\t";

% 指定列名称和类型
opts.VariableNames = ["user_id", "time", "Var3", "artist", "Var5", "Var6"];
opts.SelectedVariableNames = ["user_id", "time", "artist"];
opts.VariableTypes = ["string", "string", "string", "string", "string", "string"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 指定变量属性
opts = setvaropts(opts, ["user_id", "time", "Var3", "artist", "Var5", "Var6"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["user_id", "time", "Var3", "artist", "Var5", "Var6"], "EmptyFieldRule", "auto");

% 导入数据
output = readtable(filename, opts);

end