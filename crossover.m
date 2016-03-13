%%Crossover Function
function [ crossover_gaitset ] = crossover( gaitset, num_gaits,num_steps_gait )
crossover_gaitset = gaitset;
for i=1:(num_gaits-1)
    stability=0;
    c=100;
    while ((stability==0)&& c>0)
        crossed=cross_gait(gaitset{i},gaitset{i+1});
        stability=check_stability_gait(crossed,num_steps_gait);
        c=c-1;
    end
    
    if(c ==0)
        display('crossover unsuccessful');
        
        if (fitness(gaitset{i})>fitness(gaitset{i+1}))
            crossover_gaitset{i} = gaitset{i};
            
        else
            crossover_gaitset{i} = gaitset{i+1};
            
        end
    else
        crossover_gaitset{i} = crossed;
    end
end
c=100;
stability=0;
while ((stability==0)&& c>0)
    crossed=cross_gait(gaitset{1},gaitset{num_gaits});
    stability=check_stability_gait(crossed,num_steps_gait);
    c=c-1;
end
if(c ==0)
    display('crossover unsuccessful');
    
    if (fitness(gaitset{1})>fitness(gaitset{num_gaits}))
        crossover_gaitset{i} = gaitset{1};
        
    else
        crossover_gaitset{i} = gaitset{num_gaits};
        
    end
else
    crossover_gaitset{i} = crossed;
end

end

