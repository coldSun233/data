function users = import_users(filename, dataLines)
%IMPORTFILE ���ı��ļ��е�������
%  USERS = IMPORTFILE(FILENAME)��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�  ������ֵ���ݡ�
%
%  USERS = IMPORTFILE(FILE, DATALINES)��ָ���м����ȡ�ı��ļ� FILENAME
%  �е����ݡ����ڲ��������м�����뽫 DATALINES ָ��Ϊ������������ N��2 �������������顣
%
%  ʾ��:
%  users = import_users("D:\Code\MATLAB\dataprocess\users.txt", [1, Inf]);
%
%  ������� READTABLE��
%
% �� MATLAB �� 2021-03-02 09:52:42 �Զ�����

%% ���봦��

% �����ָ�� dataLines���붨��Ĭ�Ϸ�Χ
if nargin < 2
    dataLines = [1, Inf];
end

%% ���õ���ѡ���������
opts = delimitedTextImportOptions("NumVariables", 5);

% ָ����Χ�ͷָ���
opts.DataLines = dataLines;
opts.Delimiter = "::";

% ָ�������ƺ�����
opts.VariableNames = ["VarName1", "VarName2", "VarName3", "VarName4", "VarName5"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];

% ָ���ļ�������
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% ��������
users = readtable(filename, opts);

%% ת��Ϊ�������
users = table2array(users);
end