function M = CLPVG(adj,NN) 
%���޴�Խ������NN=0ʱΪ����ͼ��NN=1,2,3...����ʱΪ���޴�Խ����ͼ��
n=length(adj);
LVG=zeros(n,n);      
count=0;

for ii=1:n-1
    LVG(ii,ii+1)=1;
    LVG(ii+1,ii)=1; 
    for jj=2:n-ii
        count=0;
        K1=(adj(ii+jj)-adj(ii))/(jj*1.0);
        
        for  u=1:jj-1
            K2=(adj(ii+u)-adj(ii))/(u*1.0);
            
            if(K2>=K1) 
				count=count+1 ;
            end
            
			if(count>NN) 
				break
            end
        end
            
       if(count<=NN) 
             LVG(ii,ii+jj)=1;
             LVG(ii+jj,ii)=1;           
       end
    end
end

M=LVG;
% M; %Output the adjacency matrix M


  