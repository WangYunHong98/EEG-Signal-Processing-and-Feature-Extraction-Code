%��data_615��ÿ�����Ե�ÿ��״̬������Ƭ�ν�����Ȩ�ݹ����磬��ÿ�����籣����ss��ͷ���ļ���

 clear
 clc
 tic
% name='sub1';
 file_name='data_615/sub1/o/sub1_o_*.xlsx';   %��ȡ����1����״̬�µ�����
 
 
 files=dir('data_615/sub1/o/sub1_o_*.xlsx'); %�����д��и��ļ������ļ�
 
loop_n=size(files,1);
for iii=1:loop_n   %�������е��ļ�
display(iii); 
file_name=files(iii).name;
dt1=xlsread(file_name);  %��ȡ����һ���ļ�
dt=dt1';
[n,m]=size(dt);   %��ȡ����
ep=zeros(m);
SS=zeros(m,m);   %ͬ�����󱣴���SS
for i=1:m     
data1=dt(:,i); 
display(i)
RB(:,:,i)=crp(data1,3,4,0.1,'rr');   %��ȡÿ�����źŵĵݹ�ͼ�����Ƶݹ���Ϊ0.1��Ƕ��ά��Ϊ4���ӳ�ʱ��Ϊ3
clear data1;
end
for i=1:m 
   for j=(i+1):m;
    RX=RB(:,:,i).*RB(:,:,j);  %��ȡͬ���ݹ�
    tt=size(RX);
    RX=RX-uint8(eye(tt));  %ʹ�Խ���ֵΪ0
    JRR=mean(RX(:));  %����ͬ���ݹ���
    SS(i,j)=JRR/0.1;  %����ͬ��ָ��
    SS(j,i)=SS(i,j);  
   end
end

xx=['ss_',file_name];%��ͬ�����󱣴������ss��ͷ��xlsx�ļ���

xlswrite(xx,SS);


clear SS RB dt1 dt;
end
t=toc;
t=t/60;
disp(['�����ʱ',num2str(t),'��']) 