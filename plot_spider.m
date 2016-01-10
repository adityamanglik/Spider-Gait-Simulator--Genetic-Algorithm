function [  ] = plot_spider(base_motors,joint_motors,leg_motors,feet )




for i=1:6
leg(i,:,:) = [base_motors(i,1) base_motors(i,2) base_motors(i,3);
         joint_motors(i,1) joint_motors(i,2) joint_motors(i,3);       % making leg matrix for making lines connecting points of its legs.
         leg_motors(i,1) leg_motors(i,2) leg_motors(i,3);
         feet(i,1) feet(i,2) feet(i,3)];
 end


scatter3(base_motors(:,1),base_motors(:,2),base_motors(:,3));
hold
plot3(base_motors(:,1),base_motors(:,2),base_motors(:,3),'LineWidth',2,'Color','m');
scatter3(joint_motors(:,1),joint_motors(:,2),joint_motors(:,3));     % plotting the spider
scatter3(leg_motors(:,1),leg_motors(:,2),leg_motors(:,3));
scatter3(feet(:,1),feet(:,2),feet(:,3));
scatter3(sum(base_motors(1:6,1))/6,sum(base_motors(1:6,2))/6,sum(base_motors(1:6,3))/6);
for i=1:6
    plot3(leg(i,:,1),leg(i,:,2),leg(i,:,3),'LineWidth',2,'Color','k');
end
hold off;

end

