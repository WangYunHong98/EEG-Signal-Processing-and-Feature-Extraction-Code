function OPi = PX(S,ord,t)

ly = length(S);
permlist = perms(1:ord);                    %�г�1��ord�����п��ܵ�����
c(1:length(permlist))=0;
    
OPi=zeros(1,ly-t*(ord-1));                  

 for j=1:ly-t*(ord-1)
     [a,iv]=sort(S(j:t:j+t*(ord-1)));       %��S�е�ord�����������з���iv��a�и����������еı��
     for jj=1:length(permlist)
         if (abs(permlist(jj,:)-iv))==0     %�Ƚ�����ģʽ�õ����ݵ�����ģʽ
             OPi(j)=jj;                     %OPi�������ݶ�Ӧ������ģʽ
         end
     end
 end 