function [ F ] = move_step(center, phi_i,shi_i,theta_i,phi_f,shi_f,theta_f )

% This function makes the animation of moving a spider from initial servo
% positions to final servo positions.
steps=10;
phi_inc = (phi_f-phi_i)/steps;
shi_inc = (shi_f-shi_i)/steps;               % evaluation of incrementing angles.
theta_inc = (theta_f-theta_i)/steps;

[base_motors_i,joint_motors_i,leg_motors_i,feet_i] = robot_motors_coordinates( center,phi_i,shi_i,theta_i);    % plotting initial spider.
%plot_spider(base_motors_i,joint_motors_i,leg_motors_i,feet_i);
    phi = phi_i;
    shi = shi_i;
    theta = theta_i;
   
for i=1:steps
   [base_motors_f,joint_motors_f,leg_motors_f,feet_f ] = update_coordinates(base_motors_i,joint_motors_i,leg_motors_i,feet_i,phi,shi,theta,phi+phi_inc,shi+shi_inc,theta+theta_inc);
   plot_spider(base_motors_f,joint_motors_f,leg_motors_f,feet_f);         % plotting of spider with incremented angles.
  axis equal;
  axis([-20 80 -25 30 0 15]);
  
  F(i) = getframe(); 
  
  %close all;
    % updating initial angles.
   
   base_motors_i = base_motors_f;
   joint_motors_i = joint_motors_f;
   leg_motors_i = leg_motors_f;
   feet_i = feet_f;
    
   
   phi = phi + phi_inc    ;         % incrementing angles.
   shi = shi + shi_inc   ;
   theta = theta + theta_inc ;
    
    
    
end

end

