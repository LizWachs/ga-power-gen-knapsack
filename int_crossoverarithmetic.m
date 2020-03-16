function xoverKids  = int_crossoverarithmetic(parents,options,GenomeLength,...
    FitnessFcn,unused,thisPopulation)


%IntCon constraints
IntCon = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

% How many children to produce?
nKids = length(parents)/2;
% Allocate space for the kids
xoverKids = zeros(nKids,GenomeLength);
% To move through the parents twice as fast as the kids are
% being produced, a separate index for the parents is needed
index = 1;
% for each kid...
for i=1:nKids
    % get parents
    r1 = parents(index);
    index = index + 1;
    r2 = parents(index);
    index = index + 1;
    % Children are arithmetic mean of two parents
    % ROUND will guarantee that they are integer.
    alpha = rand;
    xoverKids(i,:) = alpha*thisPopulation(r1,:) + ...
        (1-alpha)*thisPopulation(r2,:);
end

x = rand;
if x>=0.5
    xoverKids(:, IntCon) = floor(xoverKids(:, IntCon));
else
    xoverKids(:, IntCon) = ceil(xoverKids(:, IntCon));
end
range = options.PopInitRange;
xoverKids = checkboundsIntGA(xoverKids, range);