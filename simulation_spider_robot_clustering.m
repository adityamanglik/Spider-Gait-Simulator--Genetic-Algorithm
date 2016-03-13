% Simulation model of spider robot
clear;clc;
%%Initial Declarations
center_i = [0 0 7];      % initial location of center.

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 30 ];

population_size =100 ;                        % size of the population of gaits.
population_size_new = 20;
num_of_gen=10;
cross_over_rate = .2;
cross_over_rate_new = .7;
number_steps_gait=12;
num_best_gaits =  floor(cross_over_rate * population_size);
num_mutated_gaits = population_size - num_best_gaits-1;
fitness_database=zeros(population_size, num_of_gen);
aristocrats=cell([1 num_of_gen]);
fitness_tracker=zeros(population_size,1);
change_algo_at_generation = 5;
display('Generating Population......');
%%Population Generation
population = cell([1 population_size]);
next_population = cell([1 population_size]);
for i=1:population_size
    population{i} = generate_gait(angles_i,number_steps_gait);             % filling up the population with random gaits.
end

display('Population Created!');


for j=1:change_algo_at_generation-1
    %%Stores Fitness array with Fitness Values for all gaits of current
    %%generation
    
    heavyweight=population{1};
    fitness_heavyweight=fitness(population{1});
    for i=1:population_size
        fitness_tracker(i)=fitness(population{i});
        if(fitness_tracker(i)>fitness_heavyweight)
            heavyweight=population{i};
            fitness_heavyweight=fitness(population{i});
        end
    end
    
    %Storing Heavyweight of current generation
    aristocrats{j}=heavyweight;
    fitness_tracker_unsorted = fitness_tracker;
    fitness_tracker=sort(fitness_tracker);
    fitness_database(:,j)=fitness_tracker;
    display('Fitness Evaluated! and Stored!');
    
    %%Choses best gaits using Roulette Wheel, may contain repetitions
    best_gait  = best_gaits( population,population_size,fitness_tracker_unsorted,num_best_gaits);  % producing the best gaits out of the current population using roulette wheel method.
    display('Best Gaits Chosen!');
    
    %%Crossover of Gaits using best Gaits
    crossed_gaits = crossover(best_gait,num_best_gaits,number_steps_gait);
    display('Best Gaits Crossed');
    
    %%Mutation of non breeding Gaits
    mutated_gaits = cell([1 num_mutated_gaits]);
    t= randi(population_size,1,1);
    for i=1:num_mutated_gaits
        mutated_gaits{i} = mutate(population{t});
    end
    display('Mutation complete');
    
    %%Update of population
    for i=1:num_best_gaits
        next_population{i} = crossed_gaits{i};
    end
    for i=num_best_gaits+1:population_size-1
        next_population{i} = mutated_gaits{i-num_best_gaits};
    end
    next_population{population_size} =  heavyweight;
    population=next_population;
    display('Population updated, iteration complete, printing fitness of current generation!');
    fitness_tracker
end

num_best_gaits =  floor(cross_over_rate_new * population_size_new);
num_mutated_gaits = population_size_new - num_best_gaits-1;
fitness_tracker=zeros(population_size,1);


heavyweight=population{1};
fitness_heavyweight=fitness(population{1});
for i=1:population_size
    fitness_tracker(i)=fitness(population{i});
    if(fitness_tracker(i)>fitness_heavyweight)
        heavyweight=population{i};
        fitness_heavyweight=fitness(population{i});
    end
end
fitness_heavyweight

population_temp = best_gaits( population,population_size,fitness_tracker,population_size_new-1);
for i=1:population_size_new-1
    population{i} = population_temp{i};
end
population{population_size_new} = heavyweight;
fitness_tracker=zeros(population_size,1);

for j= change_algo_at_generation:num_of_gen
    
    heavyweight=population{1};
    fitness_heavyweight=fitness(population{1});
    for i=1:population_size_new
        fitness_tracker(i)=fitness(population{i});
        if(fitness_tracker(i)>fitness_heavyweight)
            heavyweight=population{i};
            fitness_heavyweight=fitness(population{i});
        end
    end
    
    %Storing Heavyweight of current generation
    aristocrats{j}=heavyweight;
    fitness_tracker_unsorted = fitness_tracker;
    fitness_tracker=sort(fitness_tracker);
    fitness_tracker
    fitness_database(:,j)=fitness_tracker;
    display('Fitness Evaluated! and Stored!');
    fitness_tracker=zeros(population_size,1);
    %%Choses best gaits using Roulette Wheel, may contain repetitions
    best_gait  = best_gaits( population,population_size_new,fitness_tracker_unsorted,num_best_gaits);  % producing the best gaits out of the current population using roulette wheel method.
    display('Best Gaits Chosen!');
    
    %%Crossover of Gaits using best Gaits
    crossed_gaits = crossover(best_gait,num_best_gaits,number_steps_gait);
    display('Best Gaits Crossed');
    
    %%Mutation of non breeding Gaits
    mutated_gaits = cell([1 num_mutated_gaits]);
    t= randi(population_size_new,1,1);
    for i=1:num_mutated_gaits
        mutated_gaits{i} = mutate2(population{t},.7);
    end
    display('Mutation complete');
    
    %%Update of population
    for i=1:num_best_gaits
        next_population{i} = crossed_gaits{i};
    end
    for i=num_best_gaits+1:population_size_new-1
        next_population{i} = mutated_gaits{i-num_best_gaits};
    end
    next_population{population_size_new} =  heavyweight;
    population=next_population;
    display('Population updated, iteration complete, printing fitness of current generation!');
    
    
end
fitness_database