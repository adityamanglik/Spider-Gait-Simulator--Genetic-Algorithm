function [ mutated_gate,success ] = mutate( gait )
%display('Beginning mutation');
num_steps = numel(gait)/18;
c=100;
flag =1;
while(c>0)
    
    mutation_step = randi(num_steps-1,1,1);
    
    
    temp=mutation_step;
    mutation_step = 3*mutation_step-2;
    init_step(1,:) = gait(mutation_step,:);
    init_step(2,:) = gait(mutation_step+1,:);
    init_step(3,:) = gait(mutation_step+2,:);
    
    
    next_gate_steps =  num_steps-temp;
    next_gate = generate_gait(init_step,next_gate_steps);
    
    %  display('next gait evaluated');
    
    gait1 = gait;
    %  display('Original Gait transferred to gait1');
    gait1(mutation_step+3:num_steps*3,:) = next_gate;
    %  display('mutation done');
    c=c-1;
    if(fitness(gait1) > fitness(gait))
        flag = 0;
        %display('mutant efficient enough');
        success = 1;
        break;
        
    end
    
    
    
end

if((c == 0) || flag)
    %display('Mutant not Efficient enough');
    gait1 = gait;
    success = 0;
end


mutated_gate = gait1;

end


