% Simulation model of spider robot
clear;clc;
%%Initial Declarations
center_i = [0 0 7];      % initial location of center.

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,90 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 60 ];

population_size = 50 ;                        % size of the population of gaits.
num_of_gen=50;
cross_over_rate = 1;
mutation_rate = .4;
number_steps_gait=12;
num_best_gaits =  floor(cross_over_rate * population_size);
num_mutated_gaits = floor(population_size*mutation_rate);
fitness_database=zeros(population_size, num_of_gen);
aristocrats=cell([1 num_of_gen]);
fitness_tracker=zeros(population_size,1);
fitness_tracker2=zeros(population_size,1);
population_database = cell([num_of_gen population_size]);
display('Generating Population......');
%%Population Generation
population = cell([1 population_size]);
next_population = cell([1 population_size]);
for i=1:population_size
    population{i} = generate_gait(angles_i,number_steps_gait,'G');             % filling up the population with random gaits.
end

display('Population Created!');


for j=1:num_of_gen
    %%Stores Fitness array with Fitness Values for all gaits of current
    %%generation
    
    for t=1:population_size
    
        population_database{j,t} = population{t};
        fitness_tracker(t) = fitness(population{t});
    end
    
%     heavyweight=population{1};
%     fitness_heavyweight=fitness(population{1});
%     for i=1:population_size
%         fitness_tracker(i)=fitness(population{i});
%         if(fitness_tracker(i)>fitness_heavyweight)
%             heavyweight=population{i};
%             fitness_heavyweight=fitness(population{i});
%         end
%     end

    
    [~,heavyweight_index] = max(fitness_tracker);
   
    
    %Storing Heavyweight of current generation
    aristocrats{j}=population{heavyweight_index};
    fitness_tracker_unsorted = fitness_tracker;
    fitness_database(:,j)=fitness_tracker;
    fitness_tracker=sort(fitness_tracker);
    
    display('Fitness Evaluated! and Stored!');
    
    %%Choses best gaits using Roulette Wheel, may contain repetitions
    best_gait  = best_gaits( population,population_size,fitness_tracker_unsorted,population_size);  % producing the best gaits out of the current population using roulette wheel method.
    display('Best Gaits Chosen!');
    
    %%Crossover of Gaits using best Gaits
    crossed_gaits = crossover(best_gait,population_size,number_steps_gait);
    display('Best Gaits Crossed');
    next_population = crossed_gaits;
    %%Mutation of non breeding Gaits
    %mutated_gaits = cell([1 num_mutated_gaits]);
    i=1;
    while( i<=num_mutated_gaits )
        
        for k=1:3
        t= randi(population_size,1,1);
        [next_population{t},success] = mutate(next_population{t});
        if(success)
            break;
        end
        end
        i=i+1;
    end
    display('Mutation complete');
    
    %%Update of population
%     for i=1:num_best_gaits
%         next_population{i} = crossed_gaits{i};
%     end
%     for i=num_best_gaits+1:population_size-1
%         next_population{i} = mutated_gaits{i-num_best_gaits};
%     end

    for i=1:population_size
    
        fitness_tracker2(i) = fitness(next_population{i});
    
    end
    
  

[~,poorest_index] = min(fitness_tracker2);

  next_population{poorest_index} =  population{heavyweight_index};

 population =  next_population;  
    
%     population=next_population;
    display('Population updated, iteration complete, printing fitness of current generation!');
    fitness_tracker
end
fitness_database






