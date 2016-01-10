%%Checks if 2 consecutive steps of a given gait is correct
function [ output ] = valid_transformation( step_1 , step_2 )
  [ ~,~,~,feet_i ] = robot_motors_coordinates( [0 0 7] ,step_1(1,:), step_1(2,:) ,step_1(3,:) );
  [ ~,~,~,feet_f ] = robot_motors_coordinates( [0 0 7] ,step_2(1,:), step_2(2,:) ,step_2(3,:) );
  
 legs_onground_1 = zeros(1,6);
 legs_onground_2 = zeros(1,6);  
  for i=1:6
    if( (3.8<feet_i(i,3)) && (feet_i(i,3)<4.1))    % legs on ground in step 1
        legs_onground_1(i) = 1;
    end
  end
for i=1:6
    if( (3.8<feet_f(i,3)) && (feet_f(i,3)<4.1))     % legs on ground in step 2
        legs_onground_2(i) = 1;
    end
end
j=1;
legs_onground_1;
legs_onground_2;
for i=1:6
    if(legs_onground_1(i) ==1)
        feet_polygon_1(j,1) = feet_i(i,1);
        feet_polygon_1(j,2) = feet_i(i,2);
        j=j+1;
    elseif(max(legs_onground_1) == 0)
        feet_polygon_1(j,1) = -25;
        feet_polygon_1(j,2) = -25;
    end
end
j=1;
for i=1:6
    if(legs_onground_2(i) ==1)
        feet_polygon_2(j,1) = feet_f(i,1);
        feet_polygon_2(j,2) = feet_f(i,2);
        j=j+1;
    elseif(max(legs_onground_2) == 0)
        feet_polygon_2(j,1) = -25;
        feet_polygon_2(j,2) = -25;
    end
end

       feet_polygon_1;
       feet_polygon_2;
  if(sum(legs_onground_2) < 3)
      output = 0;
  else
  check_1 = inpolygon(0,0,feet_polygon_1(:,1),feet_polygon_1(:,2));
  check_2 = inpolygon(0,0,feet_polygon_2(:,1),feet_polygon_2(:,2));
  output = and(check_1,check_2);
  end
end

