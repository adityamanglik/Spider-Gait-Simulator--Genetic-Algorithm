function [ gait1 ] = cross_gait ( gait1, gait2)
    %Gait Crossing Function, given 2 gaits, randomly crosses legs over, TESTED
    crossleg=(randi(2,6,1))-1;
    
    %%This Section generates a random number of legs to be crossed over,ranging from 1-5 legs
    while((sum(crossleg)==0)||(sum(crossleg)==6))
        crossleg=(randi(2,6,1))-1;
    end
    %%This section crosses the legs over
    for i=1:6
        if (crossleg(i)==1)
            for j=1:(numel(gait1)/6)
                gait1(j,i)=gait2(j,i);
            end
        end
    end %Crossing Completed

end


