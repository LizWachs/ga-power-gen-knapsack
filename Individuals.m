function Pop = Individuals(GenomeLength, ~, options)
%KnapsackWeight Calculate weight of knapsack
%
%   K = KnapsackWeight(x) calculates the weight of a knapsack 
% Problem parameters including toy value of 1500 for Need

S = [20 20 900 40 150 150 20 250 250 30 1 1 250 300 200 1 50 40 250 250];
%[S,~,~,~,~] = Load_data();
%range = options.PopInitRange;
%Need =  range(2,:);
%N = Need(1) * S(1);
Need = 10000;
%define shuffle function from Stephen Cobeldick https://www.mathworks.com/matlabcentral/answers/20789-shuffle-numbers-in-a-vector
shuffle = @(v)v(randperm(numel(v)));


Pop = zeros(options.PopulationSize,GenomeLength);
for j = 1:options.PopulationSize
 %   Difference = Need_Actual;
    Difference = Need;
    x = zeros(1,GenomeLength);
    for i=shuffle(1:GenomeLength)
        if Difference >= S(i)
            %x(i) = randi(Need_Actual/Difference);
            x(i) = randi(fix(Difference/S(i)));
            Difference = Difference - (x(i)*S(i));
        else
            x(i) = 0;
        end
        
    end
    Question = Need-sum(x*transpose(S));
    if Question ~= 0
        Decide = randi(2);
        if Decide == 1
            x(11) = x(11) + Question;
        elseif Decide ==2
            x(12) = x(12) + Question;
        else 
            x(16) = x(16) + Question;
        end
    end
    x = int16(x);
    Pop(j,:) = x;
 end
