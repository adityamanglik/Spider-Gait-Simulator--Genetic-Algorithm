function [ inc_mat ] = inc_matrix( gait )
% This function takes in the gait and outputs the increment matrix starting
% from the initial angles state.

num_steps_gait =    numel(gait)/18;
inc_mat  = ones(num_steps_gait,6);
for t=1:6
for k = 1:num_steps_gait-1
    if(gait(3*k-2,t) == gait(3*k+1,t))
        if(((gait(3*k,t) == 30 && gait(3*k-1,t) == 60) || (gait(3*k,t) == 45 && gait(3*k-1,t) == 37) || (gait(3*k,t) == 60 && gait(3*k-1,t) == 14))&&((gait(3*k+3,t) == 30 && gait(3*k+2,t) == 60) || (gait(3*k+3,t) == 45 && gait(3*k+2,t) == 37) || (gait(3*k+3,t) == 60 && gait(3*k+2,t) == 14)) )
         inc_mat(k,t) = 0;
        elseif(((gait(3*k,t) == 30 && gait(3*k-1,t) == 90) || (gait(3*k,t) == 45 && gait(3*k-1,t) == 60) || (gait(3*k,t) == 60 && gait(3*k-1,t) == 30))&&((gait(3*k+3,t) == 30 && gait(3*k+2,t) == 90) || (gait(3*k+3,t) == 45 && gait(3*k+2,t) == 60) || (gait(3*k+3,t) == 60 && gait(3*k+2,t) == 30)) )
        inc_mat(k,t) = 0;
        end
    end
end
end

