for i=1:20
    fitness_1(i) = fitness(population_database{1,i});
end
for i=1:20
    fitness_2(i) = fitness(population_database{50,i});
end

t= (1:20)';

scatter(t,fitness_1')
hold
scatter(t,fitness_2')