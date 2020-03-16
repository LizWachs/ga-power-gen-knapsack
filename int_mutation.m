function mutationChildren = int_mutation(parents, options, GenomeLength, ...
    ~, state, ~, ~)

% Function that creates the mutated children using the Gaussian
% distribution. It does not satisfy linear constraints!

%IntCon constraints
IntCon = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

shrink = 0.01; 
scale = 1;
scale = scale - shrink * scale * state.Generation/options.Generations;
range = options.PopInitRange;
lower = range(1,:);
upper = range(2,:);
scale = scale * (upper - lower);
mutationPop =  length(parents);

mutationChildren =  repmat(lower,mutationPop,1) +  ...
    repmat(scale, mutationPop,1) .* rand(mutationPop, GenomeLength);

x = rand;
if x>=0.5
    mutationChildren(:, IntCon) = floor(mutationChildren(:,IntCon));
else
    mutationChildren(:, IntCon) = ceil(mutationChildren(:,IntCon));
end

mutationChildren = checkboundsIntGA(mutationChildren, range);
