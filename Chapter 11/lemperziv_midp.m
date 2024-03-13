 function lzc = lemperziv_midp( data )
%    DataBinarization: ���ݶ�ֵ������
%    AUTHOR  :
%    DATE    :2010/05/01
%    MODIFIED:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ÿ���缫ʱ������ȡ���Լ����м�ֵ
MeanData = (max(data)+min(data))./2;                         
[l,c] = size(data);
BinaryData(1:l,1:c) = '0';
for i=1:c
    Tno =  data(:,i) > MeanData(i) ;
    BinaryData(Tno,i) = '1';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             ����һά�źŵĸ��Ӷ�
%             x:          the signal is vector
%             lzc:         the complexity of the signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=BinaryData;

c = 1;                                                                   %ģʽ��ʼֵ
S = x(1);Q = [];SQ = [];                                      %S Q SQ��ʼ��
for i=2:length(x)
    Q = strcat(Q,x(i));
    SQ = strcat(S,Q);
    SQv = SQ(1:length(SQ)-1);
    if isempty(findstr(SQv,Q))                           %���Q����SQv�е��Ӵ���˵��Q���³��ֵ�ģʽ��ִ��c ��1����      
        S = SQ;
        Q = [];
        c = c+1;    
    end
end
b = length(x)*log(2)/log(length(x));
lzc = c/b;
return;