function [ best_gait ] = best_gaits( population,population_size,fitness_value,num )

total_fitness = sum(fitness_value);

probability = fitness_value./total_fitness;

index = random('unid',population_size);

mw = max(probability);

B=0;
best_gait = cell([1 num]);

for i=1:num
    B=B+random('unif',0,2*mw);
    while(probability(index)<B)
        B=B-probability(index);
        index=index+1;
        
        if (index == population_size+1)
            index=1; 
        end
    end
    best_gait{i}=population{index};
end


end

