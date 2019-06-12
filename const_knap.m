function [c, ceq]  = const_knap(x)

%[s, ~, ~, ~, ~] = Load_data();
s = [20 20 900 40 150 150 20 250 250 30 1 1 250 300 200 1 50 40 250 250];
Need = 10000;

%Constraint ensures that supply >= demand
supply_demand = Need - (x(1)*s(1) + x(2)*s(2) + x(3)*s(3)...
    + x(4)*s(4) + x(5)*s(5) + x(6)*s(6)+ x(7)*s(7) + x(8)*s(8)...
    + x(9)*s(9) + x(10)*s(10)+ x(11)*s(11) + x(12)*s(12)...
    + x(13)*s(13) + x(14)*s(14)+ x(15)*s(15) + x(16)*s(16)...
    + x(17)*s(17) + x(18)*s(18)+ x(19)*s(19) + x(20)*s(20));

%Nonlinear constraints
c = supply_demand;

%No equality constraints
ceq = [];
