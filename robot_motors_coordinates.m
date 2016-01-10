function [ base_motors,joint_motors,leg_motors,feet ] = robot_motors_coordinates( center ,phi, shi ,theta )
xc = center(1,1); yc = center(1,2); zc = center(1,3); % coordinates of the center of robot.
l=8.5;                               % distance of base motors from center of robot.
h=2;                                 % hip length i.e. distance between base motor and joint motor.
t=5;                                 % length of tigh of the spider. i.e. distance between joint motor and led motor.
c=8.5;                               % length of calf of the spider. i.e. distance between leg motor and feet motor.
delta = [30 90 150 210 270 330];     % angles of base motors w.r.t. formard direction and is a constant.
base_motors = ones(7,3);             % initializing a 6x3 matrix for base motors.
joint_motors = ones(6,3);            % initializing a 6x3 matrix for joint motors.
leg_motors = ones(6,3);              % initializing a 6x3 matrix for leg motors.
feet = ones(6,3);                    % initializing a 6x3 matrix for feet.

for i=4:6
    phi(1,i)  = 180-phi(1,i);
end


for i=1:6
base_motors(i,1) = xc + l*cosd(delta(i));
base_motors(i,2) = yc + l*sind(delta(i));      % evaluating coordinate of base motors
base_motors(i,3) = zc;
end
base_motors(7,1) = base_motors(1,1); base_motors(7,2) = base_motors(1,2) ; base_motors(7,3) = base_motors(1,3); 
for i=1:6
    joint_motors(i,1) = base_motors(i,1) + h*sind(phi(i));
    joint_motors(i,2) = base_motors(i,2) + h*cosd(phi(i)); % evaluating coordinated of joint motors
    joint_motors(i,3) = base_motors(i,3);
end

for i=1:6
    leg_motors(i,1) = joint_motors(i,1) + t*cosd(shi(i))*sind(phi(i));
    leg_motors(i,2) = joint_motors(i,2) + t*cosd(shi(i))*cosd(phi(i));  % evaluating coordinates of leg motors
    leg_motors(i,3) = joint_motors(i,3) + t*sind(shi(i));
end

for i=1:6
    feet(i,1) = leg_motors(i,1) + c*sind(theta(i))*sind(phi(i));
    feet(i,2) = leg_motors(i,2) + c*sind(theta(i))*cosd(phi(i));      % evaluating coordinates of feet
    feet(i,3) = leg_motors(i,3) - c*cosd(theta(i));
end

end

