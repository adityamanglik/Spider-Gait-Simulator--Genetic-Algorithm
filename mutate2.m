function [ mutated_gait ] = mutate2( gait,similarity_frac )

mutated_gait = gait;

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 30 ];

flag = 1;
for i=1:1000
    mutated_gait = generate_gait(angles_i,numel(gait)/18);
    if(similar_gaits(gait,mutated_gait) > similarity_frac)
        if(fitness(mutated_gait)>fitness(gait))
            mutated_gait = gait;
            flag = 0;
        break;
        end
    end
end
if(flag)
    mutated_gait = gait;
end

end

