function [ gaitset ] = crossover( gaitset, num_ele )
%Crossover Function
for i=1:(num_ele-1)
    crossed=cross_gait(gaitset{i},gaitset{i+1});
    if ((fitness(crossed)>fitness(gaitset{i})) && (fitness(crossed)>fitness(gaitset{i})))
        gaitset{i}=crossed;
    elseif (fitness(gaitset{i+1})>fitness(gaitset{i}))
        gaitset{i}=gaitset{i+1};
    end
end
crossed=cross_gait(gaitset{1},gaitset{num_ele});
if ((fitness(crossed)>fitness(gaitset{1})) && (fitness(crossed)>fitness(gaitset{num_ele})))
    gaitset{num_ele}=crossed;
elseif (fitness(gaitset{1})>fitness(gaitset{num_ele}))
    gaitset{num_ele}=gaitset{1};
end
end

