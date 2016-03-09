# Spider-Gait-Simulator--Genetic-Algorithm
This is the MATLAB code for a project I did during December 2015 with a friend.
This program simulates a hexapod in MATLAB environment, and develops gaits for the hexapod using Genetic Algorithm. The chromosome is defined as a random gait(matrix).
Crossover,fitness and mutation functions are self-explanatory.
The hexapod only considers 2-D motion as of now. Yaw, pitch and roll of the body are unaccounted for. Fitness function is defined as maximum distance covered in positive x-axis, divided by the number of steps taken. Fitness function also penalizes sideways deviation.
To begin execution, start simulation_spider_robot.m from the command window.
