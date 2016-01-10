function [ gait1 ] = cross_gait ( gait1, gait2)
%Gait Crossing Function, given 2 gaits, randomly crosses legs over
a=randi(6,3,1);
crossleg=zeros(1,6);
for i=1:3
    crossleg(a(i))=1;
end
for i=1:6
    if (crossleg(i)==1)
        % Problem is, how to swap a 24 step column with a 9 step column
    gait1(:,i)=gait2(:,i);
        
    end
end
end


