clear
clc
m=zeros(1,20);a=zeros(1,20);b=zeros(1,20);f0=zeros(1,20);
syms x1 x2 M f;              
m(1)=1; %初始惩罚因子                   
c=10;%c为递增系数。赋初值。
a(1)=10;b(1)=10;%初始点
f0(1)=0;
v = [x1,x2];
f=-x1+x2+M*((x1+x2-1)^2+(x2-1)^2);%外点罚函数
g = jacobian(f,v);%求梯度
Hesse = jacobian(g,v);%求hesse矩阵

%外点法M迭代循环
for k=1:100                                                          
    x1=a(k);x2=b(k);M=m(k);
    %牛顿法求最优值
    for n=1:100 
        v = [x1,x2];
        G = eval(g);
        hesse = eval(Hesse);
        if(double(abs(G)<=1e-5))%最优值收敛条件
            a(k+1)=double(x1);
            b(k+1)=double(x2);
            f0(k+1)=double(eval(f));
            break;
        else
            v=v'-pinv(hesse)*G';
            x1=v(1,1);x2=v(2,1);
        end
    end
if(double(M*((x1+x2-1)^2+(x2-1)^2))<=1e-5) %惩罚因子迭代收敛条件
      fprintf('输出最优点坐标为(%f,%f)\n',a(k+1),b(k+1));   
      fprintf('惩罚因子迭代次数为%d次\n',k);
      fprintf('最终最优值为%f\n',f0(k+1));
      break;
else
      m(k+1)=c*m(k);
end
end