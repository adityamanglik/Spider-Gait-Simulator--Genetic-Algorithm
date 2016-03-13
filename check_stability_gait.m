%This Function Checks a given gait for stability at all points of time
%TESTED
function [ stability ] = check_stability_gait( gait,num_steps_gaits )
    stability=0;
    check=1;
    i=1;
    while((check==1)&&(i<num_steps_gaits))
            step=gait(3*i-2:3*i,1:6);
            step2=gait(3*i+1:3*i+3,1:6);
            check=valid_transformation(step,step2);
            i=i+1;
    end
        if (check) stability=1;
    end


