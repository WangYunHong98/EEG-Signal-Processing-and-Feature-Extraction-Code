%��ÿ�����Էֱ����t���飬ÿ�����ԵĽ��������anova��ͷ���ļ���

wc=xlsread('sub1_c_w.xlsx');  %��ȡ����1����״̬�µ�����ָ��ֵ
wo=xlsread('sub1_o_w.xlsx');  %��ȡ����1����״̬�µ�����ָ��ֵ

n1=length(wc);
n2=length(wo);

t1=ones(n1,1);
t2=ones(n2,1)+ones(n2,1);
xx=zeros(1,1);

    for jj=1:2
    X=[wc(:,jj);wo(:,jj)];
    group=[t1;t2];
    xx(jj,1)=anova1(X,group);     %����ÿ��ָ������õ�pֵ
    clear X
    end

xlswrite('anova_sub1_w.xlsx',xx);    %������ָ��ֵ��pֵ�����ڸ��ĵ�
