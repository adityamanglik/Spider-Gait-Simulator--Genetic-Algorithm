function [ gait ] = generate_gait( )
% This function generates a random working gait to be applied on the simulatoin.

init_state = [ 0  0  0  0  0  0;
              60 60 60 60 60 60;      % initial state of the spider.
              30 30 30 30 30 30];
          
 i=4;
c=1;
step(1,:) = init_state(1,:);
step(2,:) = init_state(2,:);
step(3,:) = init_state(3,:);
 while(c)         
 rand_6_inc  = (randi(2,6,1)-1)';     % leg incrementors
 rand_6_angle = (randi(3,6,1)-1)';    % leg motor angles.

 S = next_state(init_state,rand_6_inc,rand_6_angle);
 if(valid_transformation(init_state,S))
    step(i,:) = S(1,:);
    step(i+1,:) = S(2,:);
    step(i+2,:) = S(3,:);
    init_state = S;
    c = ((terminating_condition(S))||(4>=i))&&(i<21);
    i=i+3;
 end

 end 
 gait = step;

end

