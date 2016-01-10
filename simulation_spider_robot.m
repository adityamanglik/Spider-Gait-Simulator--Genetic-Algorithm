% Simulation model of spider robot
clear;clc;

center_i = [0 0 7];      % initial location of center.

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
            60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix 
            30 ,30 ,30, 30, 30, 30 ];

population_size = 20;                        % size of the population of gaits.

cross_over_rate = 1;


num_best_gaits =  floor(cross_over_rate * population_size);                              
population = cell([1 population_size]);    
center_f = zeros(population_size , 3);
for i=1:population_size            
population{i} = generate_gait();             % filling up the population with random gaits.
end
for i=1:population_size    
center_f(i,:) = spider_gait_simulator(center_i,population{i},'N');     % storing the new center coordinates of each gait after it is simulated.
end

 best_gait  = best_gaits( population,population_size,center_f(:,1),num_best_gaits);  % producing the best gaits out of the current population using roulette wheel method.

 
 










    
