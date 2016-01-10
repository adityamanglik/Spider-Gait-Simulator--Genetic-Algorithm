%test script
clear all;
clc;
center = [0 0 7];
angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
            60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix 
            30 ,30 ,30, 30, 30, 30 ];

angles_f =   [ -30    30    30   -30    30   -30;
    60    90    37    60    37    90;
    45    30    45    45    45    30];

gait1 =generate_gait()

gait2 =generate_gait()


 
gait3=cross_gait(gait1,gait2)
    
    
