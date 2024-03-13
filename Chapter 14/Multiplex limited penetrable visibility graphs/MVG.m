function [I,A] = MVG(adj,NN) 
 
    ll=size(adj);
    A = zeros( ll(2),  ll(2),  ll(1)); %��ʼ��Ϊȫ0����
    for M=1:ll(1)
    A(:,:,M)= CLPVG(adj(M,:),NN); %ÿ�㹹�����磬CLPVGΪ�����ޣ���Խ����ͼ��LPHVGΪˮƽ�����ޣ���Խ����ͼ
    end
%���ÿһ������Ľڵ��
for i = 1 :  ll(1)
deg(i,:) = sum( A(:,:,i) );
end
I = zeros( ll(1), ll(1));
%��ÿ����Ľڵ�Ƚ��б���
for i = 1 :  ll(1)
for j = 1 :  ll(1)
if i == j
I(i,j) = 0;
else
alpha = deg(i,:);
beta = deg(j,:);
%����ĳ���ֽڵ�����
for k = 1 :  ll(2)
%������ϳ��ִ���
num_alpha_beta = 0;
for l = 1 :  ll(2)
if (alpha(l) == alpha(k)) && (beta(l) == beta(k))
num_alpha_beta = num_alpha_beta +1;
end
end
%������ϸ���
P_alpha_beta = num_alpha_beta /  ll(2);
%��������е����ȵĸ���
P_alpha = sum(alpha == alpha(k)) /  ll(2);
P_beta = sum(beta == beta(k)) /  ll(2);
%���㹫ʽ
I(i,j) = I(i,j) + ( P_alpha_beta * log(P_alpha_beta / (P_alpha*P_beta)) )/num_alpha_beta;%�ȷֲ�����Ϣ��ؾ���
end
end
end
end
end

