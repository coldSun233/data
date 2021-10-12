function movies = import_movies(filename, dataLines)
%IMPORTFILE ���ı��ļ��е�������
%  MOVIES = IMPORTFILE(FILENAME)��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�
%  ���ַ���������ʽ�������ݡ�
%
%  MOVIES = IMPORTFILE(FILE, DATALINES)��ָ���м����ȡ�ı��ļ� FILENAME
%  �е����ݡ����ڲ��������м�����뽫 DATALINES ָ��Ϊ������������ N��2 �������������顣
%
%  ʾ��:
%  movies = import_movies("D:\Code\MATLAB\dataprocess\movies.txt", [1, Inf]);
%
%  ������� READTABLE��
%
% �� MATLAB �� 2021-02-28 09:38:38 �Զ�����

%% ���봦��

% �����ָ�� dataLines���붨��Ĭ�Ϸ�Χ
if nargin < 2
    dataLines = [1, Inf];
end

%% ���õ���ѡ���������
opts = delimitedTextImportOptions("NumVariables", 3);

% ָ����Χ�ͷָ���
opts.DataLines = dataLines;
opts.Delimiter = "::";

% ָ�������ƺ�����
opts.VariableNames = ["VarName1", "Var2", "AnimationChildrensComedy"];
opts.SelectedVariableNames = ["VarName1", "AnimationChildrensComedy"];
opts.VariableTypes = ["string", "string", "string"];

% ָ���ļ�������
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% ָ����������
opts = setvaropts(opts, ["VarName1", "Var2", "AnimationChildrensComedy"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["VarName1", "Var2", "AnimationChildrensComedy"], "EmptyFieldRule", "auto");

% ��������
movies = readmatrix(filename, opts);

end