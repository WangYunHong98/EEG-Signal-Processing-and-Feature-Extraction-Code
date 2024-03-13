 function lzc = lemperziv_kmeans( data )
%    DataBinarization: ���ݶ�ֵ������
%    AUTHOR  :
%    DATE    :2010/05/01
%    MODIFIED:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ÿ���缫ʱ������ȡ���Լ����м�ֵ
% data=(data-min(data))/(max(data)-min(data));
sm=mean(data);
z1=(1+0.02)*sm;
z2=(1-0.02)*sm;
                      
[l,c] = size(data);
BinaryData(1:l,1:c) = '0';
for i=1:l
    D1=(data(i,c)-z1)^2;
    D2=(data(i,c)-z2)^2;
    if D1<D2
    BinaryData(i,c) = '1';
    end
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