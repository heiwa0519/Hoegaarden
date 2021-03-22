function [t,x] = loadGnssTs(filename, dataLines)
%IMPORTFILE ���ı��ļ��е�������
%  SIMTS = IMPORTFILE(FILENAME)��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�  �Ա���ʽ�������ݡ�
%
%  SIMTS = IMPORTFILE(FILE, DATALINES)��ָ���м����ȡ�ı��ļ� FILENAME
%  �е����ݡ����ڲ��������м�����뽫 DATALINES ָ��Ϊ������������ N��2 �������������顣
%
%  ʾ��:
%  simts = importfile("D:\Softs-Data\vs-workspace\paper\Hoegaarden\code\matlab\data\sim_ts.txt", [1, Inf]);
%
%  ������� READTABLE��
%
% �� MATLAB �� 2021-03-22 12:01:18 �Զ�����

%% ���봦��

% �����ָ�� dataLines���붨��Ĭ�Ϸ�Χ
if nargin < 2
    dataLines = [1, Inf];
end

%% ���õ���ѡ��
opts = delimitedTextImportOptions("NumVariables", 2);

% ָ����Χ�ͷָ���
opts.DataLines = dataLines;
opts.Delimiter = ",";

% ָ�������ƺ�����
opts.VariableNames = ["t", "x"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% ��������
simts = readtable(filename, opts);
t = simts{:,1};
x = simts{:,2};
end