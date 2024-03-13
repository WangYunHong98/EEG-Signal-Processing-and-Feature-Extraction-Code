function [lzc]=ComplexityCompute(x,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             ����һά�źŵĸ��Ӷ�
%             x:          the signal is vector
%             lzc:         the complexity of the signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
b = length(x)*log(m)/log(length(x));
lzc = c/b;
return;