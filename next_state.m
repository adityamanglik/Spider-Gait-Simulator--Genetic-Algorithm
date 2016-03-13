function [ state ] = next_state( init_state , rand_6_inc , rand_6_angle)
% this function takes in the angles of motors of current state and the
% increments in all the legs along with the new angle codes for leg motors.

state = init_state;                          % initializing the next state.

%rand_6_inc(1) = 0;
%rand_6_inc(2) = 0;
%rand_6_inc(3) = 0;
%rand_6_inc(4) = 0;
%rand_6_inc(5) = 0;
%rand_6_inc(6) = 0;
 for i=1:6
    if(rand_6_inc(i) == 1)
       % display('incrementing leg number.......');
       % display(i);
        if((init_state(3,i) == 30 && init_state(2,i) == 60) || (init_state(3,i) == 45 && init_state(2,i) == 37) || (init_state(3,i) == 60 && init_state(2,i) == 14)) 
       %        display('Leg is currently on ground');   
            if(init_state(1,i) == 30)
       %         display('Leg is in the Forward position');
                   if(rand_6_angle(i) == 0)
                       state(3,i) = 30;
                       state(2,i) = 60;
                       state(1,i) = 0;
                   elseif(rand_6_angle(i) == 1)             
                       state(3,i) = 45;
                       state(2,i) = 37;
                       state(1,i) = 0;
                   else
                       state(3,i) = 60;
                       state(2,i) = 14;
                       state(1,i) = 0;
                   end 
               elseif(init_state(1,i) == 0)
       %            display('Leg is in the center position');
                   if(rand_6_angle(i) == 0)
                       state(3,i) = 30;
                       state(2,i) = 60;
                       state(1,i) = -30;
                   elseif(rand_6_angle(i) == 1)             
                       state(3,i) = 45;
                       state(2,i) = 37;
                       state(1,i) = -30;
                   else
                       state(3,i) = 60;
                       state(2,i) = 14;
                       state(1,i) = -30;
                   end
               elseif(init_state(1,i) == -30)
        %           display('Leg is in rear position');
                   if(rand_6_angle(i) == 0)
                       state(3,i) = 30;
                       state(2,i) = 90;
                       state(1,i) = -30;
                   elseif(rand_6_angle(i) == 1)             
                       state(3,i) = 45;
                       state(2,i) = 60;
                       state(1,i) = -30;
                   else
                       state(3,i) = 60;
                       state(2,i) = 30;
                       state(1,i) = -30;
                   end 
            end
          
      elseif((init_state(3,i) == 30 && init_state(2,i) == 90) || (init_state(3,i) == 45 && init_state(2,i) == 60) || (init_state(3,i) == 60 && init_state(2,i) == 30))
       %     display('Leg is in the air');
            if(init_state(1,i) == -30)
       %         display('Leg is in rear position');
                   if(rand_6_angle(i) == 0)
                       state(3,i) = 30;
                       state(2,i) = 90;
                       state(1,i) = 30;
                   elseif(rand_6_angle(i) == 1)             
                       state(3,i) = 45;
                       state(2,i) = 60;
                       state(1,i) = 30;
                   else
                       state(3,i) = 60;
                       state(2,i) = 30;
                       state(1,i) = 30;
                   end
            elseif(init_state(1,i) == 30)
       %         display('Leg is in the forward position');
                  if(rand_6_angle(i) == 0)
                       state(3,i) = 30;
                       state(2,i) = 60;
                       state(1,i) = 30;
                   elseif(rand_6_angle(i) == 1)             
                       state(3,i) = 45;
                       state(2,i) = 37;
                       state(1,i) = 30;
                   else
                       state(3,i) = 60;
                       state(2,i) = 14;
                       state(1,i) = 30;
                  end
            end
        end
    end
  end
    

end

