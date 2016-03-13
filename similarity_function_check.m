% Similarity check on population and their fitness values

clear;clc;
%%Initial Declarations
center_i = [0 0 7];      % initial location of center.

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 30 ];

g = [0  0  0  0  0 0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0; 
    60 60 60 60 60 60;
    30 30 30 30 30 30;
    0  0  0  0  0  0;  
    60 60 60 60 60 60
    30 30 30 30 30 30;
    0  0  0  0  0  0 ;
    60 60 60 60 60 60;
    30 30 30 30 30 30];

population_size = 20 ;                        % size of the population of gaits.
number_steps_gait=12;
population = cell([1 population_size]);

for i=1:population_size
    population{i} = generate_gait(angles_i,number_steps_gait,'G');             % filling up the population with random gaits.
end


similarity_mat = zeros(1,population_size);
fitness_val = zeros(1,population_size);
for i=1:population_size
    similarity_mat(i) = similar_gaits(g,population{i});
    fitness_val(i) = fitness(population{i})-fitness(g); 
end
t = 1:population_size
% plot(t,similarity_mat)
% figure
% plot(t,fitness_val,'Color','r')

% 
% RHO = corr(similarity_mat,fitness_val)


