%读取样本
load ex1data2.txt
data=ex1data2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 样本
X = data(:, 1:2); y = data(:,3);
fprintf('数据中前10个样本: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');
mu = mean(X);
sigma = std(X); %计算标准差
X = (X-repmat(mu,size(X,1),1))./repmat(sigma,size(X,1),1);%特征规范化
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%梯度下降法
m = length(y);%训练组个数
X = [ones(m,1) X];
theta = zeros(3, 1);
alpha = 0.01;
J = zeros(8500, 1);
for i = 1:8500
     theta = theta - alpha/m*X'*(X*theta - y);
     J(i) = Cost(X, y, theta);
end
fprintf('theta梯度下降后值为[%f  %f  %f ]\n', theta(1), theta(2),theta(3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%画图
figure;
plot(1:numel(J), J, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
price = [1 (([1650 3]-mu) ./ sigma)] * theta ;
fprintf('预测1650平方英尺, 三卧室房价:\n $%f\n', price);
