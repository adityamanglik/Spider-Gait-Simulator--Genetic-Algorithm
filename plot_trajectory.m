function [ dataset ] = plot_trajectory( gait , iterations ,condition2)
num = numel(gait)/18;
center_i = [0 0 7];
dataset = zeros(iterations*num,2);
angles_i = [ 0 , 0 , 0 , 0 , 0 , 0;
    60 ,60 ,60 ,60 ,60 ,60 ;         % initial angle matrix
    30 ,30 ,30, 30, 30, 30 ];

condition = 'N';
k=1;
for j=1:iterations
for i=1:num
angles_f(1,:) = gait(3*i-2,:);
angles_f(2,:) = gait(3*i-1,:);
angles_f(3,:) = gait(3*i,:);
[ center_f ,~] = spider_step_simulator( center_i,angles_i,angles_f ,condition);
center_i=center_f;
angles_i = angles_f;
dataset(k,1) = center_f(1,1);
dataset(k,2) = center_f(1,2);
k=k+1;
end
end
if(condition2 == 'Y')

 plot(dataset(:,2),dataset(:,1),'Color','r');
axis equal
end
end

