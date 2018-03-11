%��ȡ����
load ex1data1.txt
data=ex1data1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����ͼ
X = data(:, 1); y = data(:, 2);
plot(X,y,'rx','MarkerSize',8);
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�ݶ��½���
m = length(y);%ѵ�������
syms theta0 theta1 
theta0 = 0;
theta1 = 0;
theta = [theta0;theta1];
X = [ones(m,1), data(:,1)];
Cost(X, y, theta);%������ʧ����
alpha = 0.01;
J = zeros(1500, 1);
for i = 1:1500
     theta=theta-alpha*X'*(X*theta-y)/m;
     J(i) = Cost(X, y, theta);
end
fprintf('%f %f \n', theta(1), theta(2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����h(x)��ֱ��
plot(X(:,2), X*theta, '-')
legend('ѵ������', '���Իع�')
hold off
%����J(theta0,theta1)����ͼ
figure(2);
theta0 = linspace(-10, 10, 100);
theta1 = linspace(-1, 4, 100);
J = zeros(length(theta0), length(theta1));
for i = 1:length(theta0)
    for j = 1:length(theta1)
	  t = [theta0(i); theta1(j)];    
	  J(i,j) = Cost(X, y, t);
    end
    plot(theta(1),theta(2),'rx', 'MarkerSize', 10, 'LineWidth', 2);
    hold on;
end
J = J'; 
contour(theta0, theta1, J, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold off;