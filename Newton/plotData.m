function plotData(theta, X, y)

pos = find(y == 1);
neg = find(y ==-1);

hold on;

%Plot matrix X column
plot(X(pos, 2), X(pos, 3), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 2), X(neg, 3), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
xlabel('X2');
ylabel('X3');

%Plot decision boundary
plot_x = [min(X(:,2)),  max(X(:,2))];
plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));
plot(plot_x, plot_y);

hold off;