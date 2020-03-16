function x = checkboundsIntGA(x, range)
% CHECKBOUNDS adds a subtracts 1 to the variables that are not inside the
% bounds to make them fall inside the bounds
[~, m] = size(range);

for k = 1:m
x(x(:, k)<range(1, k), k)=x(x(:, k)<range(1, k), k)+1;
x(x(:, k)>range(2, k), k)=x(x(:, k)>range(2, k), k)-1;
end