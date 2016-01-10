%%Crossover Function
function [ gaitset ] = crossover( gaitset, num_gaits,num_steps_gait )
    stability=0;
    for i=1:(num_gaits-1)
        while (stability==0)
            crossed=cross_gait(gaitset{i},gaitset{i+1});
            stability=check_stability_gait(crossed,num_steps_gait);
        end
  
        if ((fitness(crossed)>fitness(gaitset{i})) && (fitness(crossed)>fitness(gaitset{i})))
            gaitset{i}=crossed;
        
        elseif (fitness(gaitset{i+1})>fitness(gaitset{i}))
            gaitset{i}=gaitset{i+1};
       
        end
    end
    crossed=cross_gait(gaitset{1},gaitset{num_gaits});
    if ((fitness(crossed)>fitness(gaitset{1})) && (fitness(crossed)>fitness(gaitset{num_gaits})))
        gaitset{num_gaits}=crossed;
    
    elseif (fitness(gaitset{1})>fitness(gaitset{num_gaits}))
        gaitset{num_gaits}=gaitset{1};
       
    end
end

