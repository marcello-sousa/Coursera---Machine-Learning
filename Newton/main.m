clear; close all; clc

X = load('logistic_x.txt');
y = load('logistic_y.txt');

m = length(y);
X = [ones(m, 1) X];

[theta_t] = Newton(X, y, 20);

plotData(theta_t, X, y);

