function [ fitness ] = fitness(gait)
%  FITNESS FUNCTION
%   Fitness Function is defined as Displacement of centre/ No of Steps

center_i = [0 0 7];      % initial location of center.

angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
            60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix 
            30 ,30 ,30, 30, 30, 30 ];


[center_f] = spider_gait_simulator(center_i,gait,'N');

fitness = ( center_f(1)*(15-center_f(2)) ) / (numel(gait) /18);
end
