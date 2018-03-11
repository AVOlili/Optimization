%��ȡ����
load ex1data2.txt
data=ex1data2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
X = data(:, 1:2); y = data(:,3);
fprintf('������ǰ10������: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');
mu = mean(X);
sigma = std(X); %�����׼��
X = (X-repmat(mu,size(X,1),1))./repmat(sigma,size(X,1),1);%�����淶��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�ݶ��½���
m = length(y);%ѵ�������
X = [ones(m,1) X];
theta = zeros(3, 1);
alpha = 0.01;
J = zeros(8500, 1);
for i = 1:8500
     theta = theta - alpha/m*X'*(X*theta - y);
     J(i) = Cost(X, y, theta);
end
fprintf('theta�ݶ��½���ֵΪ[%f  %f  %f ]\n', theta(1), theta(2),theta(3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ͼ
figure;
plot(1:numel(J), J, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
price = [1 (([1650 3]-mu) ./ sigma)] * theta ;
fprintf('Ԥ��1650ƽ��Ӣ��, �����ҷ���:\n $%f\n', price);
