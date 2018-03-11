clear
clc
r=zeros(1,50);a=zeros(1,50);b=zeros(1,50);f0=zeros(1,50);
syms x1 x2 R f;              
r(1)=10; %初始障碍因子                   
c=0.7;%c为递减系数。赋初值。
a(1)=3;b(1)=4;%初始点
f0(1)=100;
v = [x1,x2];
f=((x1+1)^3)/3+x2+R*(1/(x1-1)+1/x2);%内点罚函数
g = jacobian(f,v);
Hesse = jacobian(g,v);

%外点法M迭代循环
for k=1:100
    x1=a(k);x2=b(k);R=r(k);
    %牛顿法求最优值
    for n=1:100 
        v = [x1,x2];
        G = eval(g);
        hesse = eval(Hesse);
        if(double(abs(G))<=1e-5)%最优值收敛条件
            a(k+1)=double(x1);
            b(k+1)=double(x2);
            f0(k+1)=double(eval(f));
            break;
        else
            v=v'- pinv(hesse)*G';
            x1=v(1,1);x2=v(2,1);
        end
    end
if(double(R*(1/(x1-1)+1/x2))<=1e-5) %障碍因子迭代收敛条件
      %输出最优点坐标，障碍因子迭代次数，最优值
      fprintf('输出最优点坐标为(%f,%f)\n',a(k+1),b(k+1));   
      fprintf('障碍因子迭代次数为%d次\n',k);
      fprintf('最终最优值为%f\n',f0(k+1));
      break;
else
      r(k+1)=c*r(k);
end
end