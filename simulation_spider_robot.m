% Simulation model of spider robot
clear;clc;

center_i = [0 0 7];      % initial location of center.

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 30 ];

population_size = 20;                        % size of the population of gaits.

cross_over_rate = 1;

fitness_val=zeros(1,population_size);
num_best_gaits =  floor(cross_over_rate * population_size);
population = cell([1 population_size]);
for i=1:population_size
    population{i} = generate_gait();             % filling up the population with random gaits.
end
for i=1:population_size
    fitness_val(i) = fitness(population{i});     % Calculating Fitness for all gaits
end

best_gait  = best_gaits( population,population_size,fitness_val,num_best_gaits);  % producing the best gaits out of the current population using roulette wheel method.

%  sort(fitness_val)
%  var(fitness_val)
%  std(fitness_val)
best_gait{1}
best_gait=crossover(best_gait, num_best_gaits);


% sort(fitness_val)
% var(fitness_val)
% std(fitness_val)







