function [base_motors_f,joint_motors_f,leg_motors_f,feet_f ] = update_coordinates(base_motors_i,joint_motors_i,leg_motors_i,feet_i,phi_i,shi_i,theta_i,phi_f,shi_f,theta_f)

%this functions takes initial values of phi , shi , theta and their updated values and returns the new coordinates of all the motors.

h=2;                                 % hip length i.e. distance between base motor and joint motor.
t=5;                                 % length of tigh of the spider. i.e. distance between joint motor and led motor.
c=8.5;                               % length of calf of the spider. i.e. distance between leg motor and feet motor.

%figure
%plot_spider(base_motors_i,joint_motors_i,leg_motors_i,feet_i);

center = sum(base_motors_i(1:6,:))/6;

[~,~,~,feet_f]=robot_motors_coordinates(center,phi_f,shi_f,theta_f);  % final feet coordinates
                                                              
for i=4:6
    phi_i(1,i)  = 180-phi_i(1,i);
end
for i=4:6
    phi_f(1,i)  = 180-phi_f(1,i);
end

 
legs_onground = zeros(1,6);
leg_motors_f=zeros(6,3);
base_motors_f = zeros(7,3);
base_motors_impulse = zeros(6,3);
joint_motors_f=zeros(6,3);
for i=1:6
    if( (3.8<feet_i(i,3)) && (feet_i(i,3)<4.1) && (3.8<feet_f(i,3)) && (feet_f(i,3)<4.1))     % finding out which all legs were in contact with the ground while motion was happening
        legs_onground(i) = 1;
    end
end
     
count = 0;

for i=1:6
    if(legs_onground(i) ==1 && min(eq(feet_i(i,:),feet_f(i,:))) == 0)         % calculation of number of legs that were on ground and moved.
       count = count+1;
    end
end

alpha = 1-count/6;                                             % coffecient of forward motion of body w.r.t. feet's motion.
for i=1:6
    if(legs_onground(i) ==1)
        base_motors_impulse(i,:) = alpha*(feet_i(i,:) - feet_f(i,:));      % calculation of impulse on each of the base motors due to the motion.
    end
end

delta_center = sum(base_motors_impulse)/6;                          % change in the position of center.

for i=1:6
base_motors_f(i,:) = base_motors_i(i,:) + delta_center;                       % change in the positon of base motors.
end
base_motors_f(7,:) = base_motors_f(1,:);
for i=1:6
    joint_motors_f(i,1) = base_motors_f(i,1) + h*sind(phi_f(i));
    joint_motors_f(i,2) = base_motors_f(i,2) + h*cosd(phi_f(i));     % evaluating new coordinated of joint motors
    joint_motors_f(i,3) = base_motors_f(i,3);
end

for i=1:6
    leg_motors_f(i,1) = joint_motors_f(i,1) + t*cosd(shi_f(i))*sind(phi_f(i));
    leg_motors_f(i,2) = joint_motors_f(i,2) + t*cosd(shi_f(i))*cosd(phi_f(i));  % evaluating new coordinates of leg motors
    leg_motors_f(i,3) = joint_motors_f(i,3) + t*sind(shi_f(i));
end

for i=1:6
    feet_f(i,1) = leg_motors_f(i,1) + c*sind(theta_f(i))*sind(phi_f(i));
    feet_f(i,2) = leg_motors_f(i,2) + c*sind(theta_f(i))*cosd(phi_f(i));      % evaluating new coordinates of feet
    feet_f(i,3) = leg_motors_f(i,3) - c*cosd(theta_f(i));
end
end

