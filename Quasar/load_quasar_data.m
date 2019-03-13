% load_quasar_data
%
% Loads the data in the quasar data files
%
% Upon completion of this script, the matrices and data are as follows:
%
% lambdas - A length n = 450 vector of wavelengths {1150, ..., 1599}
% train_qso - A size m-by-n matrix, where m = 200 and n = 450, of noisy
%      observed quasar spectra for training.
% test_qso - A size m-by-n matrix, where m = 200 and n = 450, of noisy observed
%       quasar spectra for testing.

clear; close all; clc

load quasar_train.csv;
lambdas = quasar_train(1, :)';
train_qso = quasar_train(2:end, :);
load quasar_test.csv;
test_qso = quasar_test(2:end, :);

% Part one

J = 0;
y = [,train_qso(1,:)]';
m = length(y);

X = [ones(m, 1), lambdas];
theta = zeros(2, 1);
plot(X(:,2), y, '.');
xlabel('Wavelenghts');
ylabel('Flux');
%J = (X*theta - y)'*(X*theta - y);
theta = pinv(X'*X)*X'*y;
hold on;
plot(X(:,2), X*theta, 'r');
legend('Spectra data', 'LWLR curve');

%Part two

theta_t = 0;
tau = 5;
w = zeros(m, 1);
x = X(:,2);
for i = 1:m,
    w(i) = exp(-((X(:,2)-x(i))'*(X(:,2)-x(i)))/(2*tau.^2));
    i = i + 1;
end
w
W = [ones(m, 1), w];
theta_t = pinv(X'*W*X)*(X*W*y);
disp(theta_t)





