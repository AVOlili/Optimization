clear
clc
m=zeros(1,20);a=zeros(1,20);b=zeros(1,20);f0=zeros(1,20);
syms x1 x2 M f;              
m(1)=1; %��ʼ�ͷ�����                   
c=10;%cΪ����ϵ��������ֵ��
a(1)=10;b(1)=10;%��ʼ��
f0(1)=0;
v = [x1,x2];
f=-x1+x2+M*((x1+x2-1)^2+(x2-1)^2);%��㷣����
g = jacobian(f,v);%���ݶ�
Hesse = jacobian(g,v);%��hesse����

%��㷨M����ѭ��
for k=1:100                                                          
    x1=a(k);x2=b(k);M=m(k);
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
if(double(M*((x1+x2-1)^2+(x2-1)^2))<=1e-5) %�ͷ����ӵ�����������
      fprintf('������ŵ�����Ϊ(%f,%f)\n',a(k+1),b(k+1));   
      fprintf('�ͷ����ӵ�������Ϊ%d��\n',k);
      fprintf('��������ֵΪ%f\n',f0(k+1));
      break;
else
      m(k+1)=c*m(k);
end
end