clear
clc
r=zeros(1,50);a=zeros(1,50);b=zeros(1,50);f0=zeros(1,50);
syms x1 x2 R f;              
r(1)=10; %��ʼ�ϰ�����                   
c=0.7;%cΪ�ݼ�ϵ��������ֵ��
a(1)=3;b(1)=4;%��ʼ��
f0(1)=100;
v = [x1,x2];
f=((x1+1)^3)/3+x2+R*(1/(x1-1)+1/x2);%�ڵ㷣����
g = jacobian(f,v);
Hesse = jacobian(g,v);

%��㷨M����ѭ��
for k=1:100
    x1=a(k);x2=b(k);R=r(k);
    %ţ�ٷ�������ֵ
    for n=1:100 
        v = [x1,x2];
        G = eval(g);
        hesse = eval(Hesse);
        if(double(abs(G))<=1e-5)%����ֵ��������
            a(k+1)=double(x1);
            b(k+1)=double(x2);
            f0(k+1)=double(eval(f));
            break;
        else
            v=v'- pinv(hesse)*G';
            x1=v(1,1);x2=v(2,1);
        end
    end
if(double(R*(1/(x1-1)+1/x2))<=1e-5) %�ϰ����ӵ�����������
      %������ŵ����꣬�ϰ����ӵ�������������ֵ
      fprintf('������ŵ�����Ϊ(%f,%f)\n',a(k+1),b(k+1));   
      fprintf('�ϰ����ӵ�������Ϊ%d��\n',k);
      fprintf('��������ֵΪ%f\n',f0(k+1));
      break;
else
      r(k+1)=c*r(k);
end
end