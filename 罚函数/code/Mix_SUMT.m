clear
clc
r=zeros(1,50);a=zeros(1,50);b=zeros(1,50);f0=zeros(1,50);
syms x1 x2 R f;              
r(1)=10; %��ʼ������                   
c=0.5;%cΪ����ϵ��������ֵ��
a(1)=10;b(1)=10;%��ʼ��
f0(1)=0;
v = [x1,x2];
f=-x1+x2+R.^(-1/2)*(x1+x2-1)^2+R*1/(x2-1);%��Ϸ�����
g = jacobian(f,v);%���ݶ�
Hesse = jacobian(g,v);%��hesse����

%��Ϸ�M����ѭ��
for k=1:100                                                          
    x1=a(k);x2=b(k);R=r(k);
    %ţ�ٷ�������ֵ
    for n=1:100 
        v = [x1,x2];
        G = eval(g);
        hesse = eval(Hesse);
        if(double(abs(G)<=1e-5))%����ֵ��������
            a(k+1)=double(x1);
            b(k+1)=double(x2);
            f0(k+1)=double(eval(f));
            break;
        else
            v=v'-pinv(hesse)*G';
            x1=v(1,1);x2=v(2,1);
        end
    end
if k>1 && double(sqrt((a(k)-a(k-1)).^2+(b(k)-b(k-1)).^2))<=1e-5 %�����ӵ�����������
      fprintf('������ŵ�����Ϊ(%f,%f)\n',a(k+1),b(k+1));   
      fprintf('�����ӵ�������Ϊ%d��\n',k);
      fprintf('��������ֵΪ%f\n',f0(k+1));
      break;
else
      r(k+1)=c*r(k);
end
end