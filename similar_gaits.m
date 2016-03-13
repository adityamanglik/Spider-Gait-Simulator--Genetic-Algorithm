function [ similarity ] = similar_gaits( gait1,gait2 )

inc_mat_1 = inc_matrix(gait1);
inc_mat_2 = inc_matrix(gait2);
num_steps_gaits = numel(gait1)/18;
similarity =  zeros(num_steps_gaits,6); 
for i=1:6
    
    for j= 1:num_steps_gaits
        if(inc_mat_1(j,i) == inc_mat_2(j,i))
            similarity(j,i) = num_steps_gaits - j+1;
        end
    end
        
    
end    

similarity = sum(sum(similarity))/468;

end

