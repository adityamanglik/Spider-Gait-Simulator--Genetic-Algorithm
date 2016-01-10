function [center_f] = spider_gait_simulator(center_i,gait,condition )

num = numel(gait)/6 -3;
j=1;
for i=1:3:num

    [center_f,F] = spider_step_simulator( center_i,gait(i:i+2,:),gait(i+3:i+5,:),condition);
    center_i=center_f;
    frames(j,:) = F;
    j=j+1;
end
for i=1:3:num

    [center_f,F] = spider_step_simulator( center_i,gait(i:i+2,:),gait(i+3:i+5,:),condition);
    center_i=center_f;
    frames(j,:) = F;
    j=j+1;
end

for i=1:3:num

    [center_f,F] = spider_step_simulator( center_i,gait(i:i+2,:),gait(i+3:i+5,:),condition);
    center_i=center_f;
    frames(j,:) = F;
    j=j+1;
end
for i=1:3:num

    [center_f,F] = spider_step_simulator( center_i,gait(i:i+2,:),gait(i+3:i+5,:),condition);
    center_i=center_f;
    frames(j,:) = F;
    j=j+1;
end
for i=1:3:num

    [center_f,F] = spider_step_simulator( center_i,gait(i:i+2,:),gait(i+3:i+5,:),condition);
    center_i=center_f;
    frames(j,:) = F;
    j=j+1;
end
%display(center_f);
if(condition == 'Y')
    movie(frames,300,5);
end
end

