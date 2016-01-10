function [ mutated_gate ] = mutate( gait )

num_steps = numel(gait)/18;
c=1;
while(c)
if(num_steps >8)
    pd  = makedist('Poisson','lambda',4);
    mutation_step = 11 - random(pd);
else
    pd = makedist('Poisson','lambda',2.5);
    mutation_step = 8 - random(pd);
end
mutation_step = 3*mutation_step -2;

init_step(1,:) = gait(mutation_step,:);
init_step(2,:) = gait(mutation_step+1,:);
init_step(3,:) = gait(mutation_step+2,:);



next_gate = generate_gait(init_step,num_steps-(mutation_step+2)/3+1);

gait1(1:(mutation_step-1),:) = gait(1:(mutation_step-1),:);

gait1(mutation_step:num_steps*3,:) = next_gate;
c=c+1;
if(fitness(gait1) > fitness(gait))
    c=0;
elseif(c>25)
    gait1 = gait;
    c=0;
end

end
mutated_gate = gait1;
end


