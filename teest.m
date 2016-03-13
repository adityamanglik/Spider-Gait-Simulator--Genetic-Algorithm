angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 30 ];

[ base_motors,joint_motors,leg_motors,feet ] = robot_motors_coordinates( [0 0 7] ,angles_i(1,:), angles_i(2,:) ,angles_i(3,:) );

plot_spider(base_motors,joint_motors,leg_motors,feet )