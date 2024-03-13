function  resultapen=appro_entropy_func(input_signal,input_m,input_r)
%������غ���
%input_signalΪҪ������ص����У�input_mΪ������ģʽ��ά����input_rΪ��������

resultapen = calfai(input_signal,input_m,input_r) - ...
                calfai(input_signal,input_m+1,input_r);

function fai=calfai(x,m,r) 

N            = length(x);%�źŵĵ���
rownum       = N-m+1;%�����mάʸ��������
signalmatrix = zeros(rownum,m);%�����źž���
for i=1:1:rownum
    signalmatrix(i,:)=x(i:i+m-1);
end

fai         = 0;
dmatrix     = zeros(rownum,rownum);
thetamatrix = zeros(rownum,rownum);
C           = zeros(1,rownum);
for ii=1:1:rownum
    sgmatrix_temp     = ones(rownum,1)* signalmatrix(ii,:);
    dmatrix(:,ii)     = max(abs(sgmatrix_temp-signalmatrix),[],2); %��ii�����������������еľ������ֵ����
    thetamatrix(:,ii) = (r>dmatrix(:,ii));
    C(1,ii)           = sum(thetamatrix(:,ii))/rownum;
    fai               = fai+log(C(1,ii))/rownum;
end


