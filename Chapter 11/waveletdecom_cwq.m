function [ E ] = waveletdecom_cwq( x,n,wpname )
[C,L]=wavedec(x,n,wpname);        %�����ݽ���С�����ֽ�
for k=1:n
      %wpcoef(wpt1,[n,i-1])�����n���i���ڵ��ϵ��
%       disp('ÿ���ڵ������E(i)');
      SRC(k,:)=wrcoef('a',C,L,'db4',k);%�߶�
      SRD(k,:)=wrcoef('d',C,L,'db4',k);%ϸ��ϵ��

  E(1,k)=norm(SRD(k,:))*norm(SRD(k,:));
      %���i���ڵ�ķ���ƽ������ʵҲ����ƽ����
end
E(1,n+1)=norm(SRC(n,:))*norm(SRC(n,:));
%  disp('С�����ֽ�������E_total');
E_total=sum(E);  %��������
y=E_total;
% disp('������ÿ���ڵ�ĸ���P');
% for i=1:n+1
%    p(i)= E(1,i)/E_total    %��ÿ���ڵ�ĸ���
% end


end

