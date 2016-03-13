function [ center_f , F ] = spider_step_simulator( center_i,angles_i,angles_f ,condition)

%this function simulates a single step taken by different legs of robot.
% phi is initial anglar displacement of joint motor w.r.t. base motor.
% shi is initial angular displacement of leg motor w.r.t. joint motor.
% theta is initial angular displacement of feet w.r.t. leg motor.

phi_i = angles_i(1,:);
shi_i = angles_i(2,:);
theta_i = angles_i(3,:);

phi_f = angles_f(1,:);
shi_f = angles_f(2,:);
theta_f = angles_f(3,:);

[base_motors_i,joint_motors_i,leg_motors_i,feet_i]=robot_motors_coordinates(center_i,phi_i,shi_i,theta_i); 
[base_motors_f,joint_motors_f,leg_motors_f,feet_f]=update_coordinates(base_motors_i,joint_motors_i,leg_motors_i,feet_i,phi_i,shi_i,theta_i,phi_f,shi_f,theta_f); 

delta_center = (sum(base_motors_f(1:6,:)) - sum(base_motors_i(1:6,:)))/6 ;

center_f = delta_center + center_i;

if(condition == 'Y')
    F = move_step(center_i,phi_i,shi_i,theta_i,phi_f,shi_f,theta_f);
elseif(condition == 'N')
    F = 0;
end

end

