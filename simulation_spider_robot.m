% Simulation model of spider robot
clear;clc;
%%Initial Declarations
center_i = [0 0 7];      % initial location of center.

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 30 ];

population_size = 20;                        % size of the population of gaits.
cross_over_rate = 1;
number_steps_gait=12;
num_best_gaits =  floor(cross_over_rate * population_size);
'Generating Population'
%%Population Generation
population = cell([1 population_size]);
center_f = zeros(population_size , 3);
for i=1:population_size
    population{i} = generate_gait(angles_i,number_steps_gait);             % filling up the population with random gaits.
end
for i=1:population_size
    center_f(i,:) = spider_gait_simulator(center_i,population{i},'N');     % storing the new center coordinates of each gait after it is simulated.
end
'Population Created!'
%%Stores Fitness array with Fitness Values for all gaits
fitness_tracker=zeros(population_size,1);
for i=1:population_size
    fitness_tracker(i)=fitness(population{i});
end
'Fitness Evaluated!'
best_gait  = best_gaits( population,population_size,fitness_tracker,num_best_gaits);  % producing the best gaits out of the current population using roulette wheel method.
'Best Gaits Chosen!'
best_gait{1}
best_gait = crossover(best_gait,num_best_gaits,number_steps_gait);
'Best Gaits Crossed'
best_gait{1}














