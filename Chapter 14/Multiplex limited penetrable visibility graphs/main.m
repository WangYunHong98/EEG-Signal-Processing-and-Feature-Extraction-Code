

NN=1;   %�������޴�Խ�Ӿ�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
xx0=['E:\MATLAB\opencloseeyes\data_615\sub8\c']; %��ȡ�����Ե�����
files=dir(xx0);
loop_n=size(files,1);
for i=1:loop_n
     disp(i)
    file_name=files(i).name;
    dt1=xlsread(file_name);
    [I] = MVG(dt1,NN); %�����������޴�Խ����ͼ������
    sub8c(i,1)=TR(I); %�����������ָ�괫����
 end

xx0=['E:\MATLAB\opencloseeyes\data_615\sub8\o'];%��ȡ�����Ե�����
files=dir(xx0);
loop_n=size(files,1);
for i=1:loop_n
     disp(i)
    file_name=files(i).name;
    dt1=xlsread(file_name);
    [I] = MVG(dt1,NN);  %�����������޴�Խ����ͼ������
    sub8o(i,1)=MDDD(I); %������������ָ�괫����
end

[h,p] = ttest(sub8c,sub8o); %��������������ָ��pvalueֵ
