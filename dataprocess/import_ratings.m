function ratings1 = import_ratings(filename, dataLines)
%IMPORTFILE ���ı��ļ��е�������
%  RATINGS1 = IMPORTFILE(FILENAME)��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�  ������ֵ���ݡ�
%
%  RATINGS1 = IMPORTFILE(FILE, DATALINES)��ָ���м����ȡ�ı��ļ� FILENAME
%  �е����ݡ����ڲ��������м�����뽫 DATALINES ָ��Ϊ������������ N��2 �������������顣
%
%  ʾ��:
%  ratings1 = import_ratings("D:\Code\MATLAB\dataprocess\ratings.txt", [1, Inf]);
%
%  ������� READTABLE��
%
% �� MATLAB �� 2021-02-28 09:31:31 �Զ�����

%% ���봦��

% �����ָ�� dataLines���붨��Ĭ�Ϸ�Χ
if nargin < 2
    dataLines = [1, Inf];
end

%% ���õ���ѡ���������
opts = delimitedTextImportOptions("NumVariables", 4);

% ָ����Χ�ͷָ���
opts.DataLines = dataLines;
opts.Delimiter = ":";

% ָ�������ƺ�����
opts.VariableNames = ["VarName1", "VarName2", "Var3", "VarName4"];
opts.SelectedVariableNames = ["VarName1", "VarName2", "VarName4"];
opts.VariableTypes = ["double", "double", "string", "double"];

% ָ���ļ�������
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% ָ����������
opts = setvaropts(opts, "Var3", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Var3", "EmptyFieldRule", "auto");

% ��������
ratings1 = readtable(filename, opts);

%% ת��Ϊ�������
ratings1 = table2array(ratings1);
end