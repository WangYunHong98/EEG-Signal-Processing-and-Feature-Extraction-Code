%���������ɵ�������ȡָ��ֵ
clear
 clc
 tic
file_name='recur615\open\sub1\ss_*.xlsx';  %��ȡopen״̬�±���sub1���������
files=dir('recur615\open\sub1\ss_*.xlsx');
loop_n=size(files,1);
Inte_CM=zeros(loop_n,2);   %5��ʾ�ļ���Ĳ����ĸ���
for jj=1:loop_n      %jj��ʾƬ�α��
display(jj) 
file_name=files(jj).name; 
Matrix=xlsread(file_name); 
Spar = 0.1:0.01:0.35;  %���ñ��ܶ�Ϊ10%-35%,����Ϊ1%
N_Spar = length(Spar);
roi=61;%ͨ����Ŀ
    EL_62 = zeros(1,N_Spar);% ��Ȩ�ֲ�Ч��
    GE_62= zeros(1,N_Spar);  % ��Ȩȫ��Ч��
      for n = 1:N_Spar
       Mat_spar = threshold_proportional(Matrix,Spar(n)); %������ͬ���ܶ��µ��������      
        El_62(1,n) = sum(efficiency_wei(Mat_spar,1))/61; %����ÿ�����ܶ��µľֲ�Ч��
        GE_62(1,n)=efficiency_wei(Mat_spar,0); %����ÿ�����ܶ��µ�ȫ��Ч��
      end
  
    Inte_CM(jj,1) = trapz(Spar,El_62(1,:));  %������ܶȺ;ֲ�Ч�ʵ������Ϊ���յľֲ�Ч��

    Inte_CM(jj,2) = trapz(Spar,GE_62(1,:)); %������ܶȺ�ȫ��Ч�ʵ������Ϊ���յ�ȫ��Ч��
end
kk=('sub1_o_w.xlsx');  %��������ڸ��ļ���
xlswrite(kk,Inte_CM);