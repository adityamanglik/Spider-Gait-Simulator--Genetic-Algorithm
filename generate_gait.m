function [ gait ] = generate_gait( init_state , gait_length)
% This function generates a random working gait to be applied on the simulatoin.

%init_state = [ 0  0  0  0  0  0;
%              60 60 60 60 60 60;      % initial state of the spider.
%              30 30 30 30 30 30];
init_state_temp = init_state;          
 i=4;

count = 10;
step(1,:) = init_state(1,:);
step(2,:) = init_state(2,:);
step(3,:) = init_state(3,:);
 while(i<3*gait_length) 

         if( i == 4)                                                 % this should run only for the first time in the entire gait generation.
         while(count)
         count = count -1;
         rand_6_inc  = (randi(2,6,1)-1)';     % leg incrementors
         rand_6_angle = (randi(3,6,1)-1)';    % leg motor angles.
         for j=1:3
         S = next_state(init_state,rand_6_inc,rand_6_angle);
         init_state = S;
         end
               init_state = init_state_temp;                          % this part allows the robot to directly tranfer from 'DC' state to 'UF' state.
               if(valid_transformation(init_state,S))
               step(i,:) = S(1,:);
               step(i+1,:) = S(2,:);
               step(i+2,:) = S(3,:);
               init_state = S;
               i=i+3;
               break;
               end
         end
         end
 rand_6_inc  = (randi(2,6,1)-1)';     % leg incrementors
 rand_6_angle = (randi(3,6,1)-1)';    % leg motor angles.

 S = next_state(init_state,rand_6_inc,rand_6_angle);
 if(valid_transformation(init_state,S))
    step(i,:) = S(1,:);
    step(i+1,:) = S(2,:);
    step(i+2,:) = S(3,:);
    init_state = S;
    
    i=i+3;
 end

 end 
 gait = step;



end

