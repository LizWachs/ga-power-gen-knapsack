# ga-power-gen-knapsack
Multi-objective optimization model based on knapsack problem for power generation using MATLAB ga.These are MATLAB livescripts with most dependencies.
Used two sample files from MATLAB: int_mutation and int_crossoverarithmetic, which are not included since they are proprietary from MATLAB. 
Data file is EnergySources.xlsx.
Used random seeds stored in Random_seeds.xlsx.

Main file is KnapsackmultiobjGA_overnightLCOE.mlx which uses the overnight costs to determine the LCOE.
The other main file is KnapsackmultiobjGA.mlx

Need is set at 10,000 MW, which can be changed by user. 

To use the sample files from MATLAB for mutation and crossover, you must copy and paste the following code to constrain the variables used to integers:
IntCon = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];

