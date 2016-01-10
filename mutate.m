function [gait1 ] = mutate( gait )

num_steps = numel(gait)/18;
k=1;

j=randi(6,1,1);
inc = zeros(1,num_steps);
for i=4:3:(numel(gait)/6)
     
    if(gait(i,j) ~= gait(i-3))
     inc(k) = 1; 
     
    elseif(((gait(i+2,j) == 30 && gait(i+1,j) == 60) || (gait(i+2,j) == 45 && gait(i+1,j) == 37) || (gait(i+2,j) == 60 && gait(i+1,j) == 14))&&((gait(i-1,j) == 30 && gait(i-2,j) == 90) || (gait(i-1,j) == 45 && gait(i-2,j) == 60) || (gait(i-1,j) == 60 && gait(i-2,j) == 30)))
    inc(k) = 1;           
    elseif(((gait(i-2,j) == 30 && gait(i-2,j) == 60) || (gait(i-2,j) == 45 && gait(i-2,j) == 37) || (gait(i-2,j) == 60 && gait(i-2,j) == 14))&&((gait(i+2,j) == 30 && gait(i+1,j) == 90) || (gait(i+2,j) == 45 && gait(i+1,j) == 60) || (gait(i+2,j) == 60 && gait(i+1,j) == 30)))
    inc(k) = 1;
    else
    inc(k) = 0;
    end
    k=k+1;
end
    mutation_step = randi(numel(gait)/18,1,1)
inc    
    if(inc(mutation_step) == 0)
        inc(mutation_step) = 1;
    else
        inc(mutation_step) = 0;
    end
t=1; 
j
inc

for k=1:3:(numel(gait)/6)  
     if(inc(t) == 1)
      if((gait(k+1,j) == 30 && gait(k+2,j) == 60) || (gait(k+1,j) == 45 && gait(k+2,j) == 37) || (gait(k+1,j) == 60 && gait(k+2,j) == 14)) 
               display('Leg is currently on ground');   
            if(gait(k,j) == 30)
                display('Leg is in the Forward position');
                   if(randi(3,1,1) == 1)
                       gait(k+5,j) = 30;
                       gait(k+4,j) = 60;
                       gait(k+3,j) = 0;
                   elseif(randi(3,1,1) == 2)             
                       gait(k+5,j) = 45;
                       gait(k+4,j) = 37;
                       gait(k+3,j) = 0;
                   elseif(randi(3,1,1) == 3)
                       gait(k+5,j) = 60;
                       gait(k+4,j) = 14;
                       gait(k+3,j) = 0;
                   end 
               elseif(gait(k,j) == 0)
                  display('Leg is in the center position');
                   if(randi(3,1,1) == 1)
                       gait(k+5,j) = 30;
                       gait(k+4,j) = 60;
                       gait(k+3,j) = -30;
                   elseif(randi(3,1,1) == 2)             
                       gait(k+5,j) = 45;
                       gait(k+4,j) = 37;
                       gait(k+3,j) = -30;
                   elseif(randi(3,1,1) == 3)
                       gait(k+5,j) = 60;
                       gait(k+4,j) = 14;
                       gait(k+3,j) = -30;
                   end
               elseif(gait(k,j) == -30)
                   display('Leg is in rear position');
                   if(rand_6_angle(i) == 0)
                       gait(k+5,j) = 30;
                       gait(k+4,j) = 90;
                       gait(k+3,j) = -30;
                   elseif(randi(3,1,1) == 2)             
                       gait(k+5,j) = 45;
                       gait(k+4,j) = 60;
                       gait(k+3,j) = -30;
                   elseif(randi(3,1,1) == 3)
                       gait(k+5,j) = 60;
                       gait(k+4,j) = 30;
                       gait(k+3,j) = -30;
                   end 
            end
          
      elseif((gait(k+1,j) == 30 && gait(k+2,j) == 90) || (gait(k+1,j) == 45 && gait(k+2,j) == 60) || (gait(k+1,j) == 60 && gait(k+2,j) == 30))
            display('Leg is in the air');
            if(gait(k,j) == -30)
                display('Leg is in rear position');
                   if(randi(3,1,1) == 1)
                      gait(k+5,j) = 30;
                       gait(k+4,j) = 90;
                        gait(k+3,j) = 30;
                   elseif(randi(3,1,1) == 2)             
                       gait(k+5,j) = 45;
                       gait(k+4,j) = 60;
                       gait(k+3,j) = 30;
                   elseif(randi(3,1,1) == 3)
                      gait(k+5,j) = 60;
                      gait(k+4,j) = 30;
                      gait(k+3,j) = 30;
                   end
            elseif(gait(k,j) == 30)
                display('Leg is in the forward position');
                  if(randi(3,1,1) == 1)
                       gait(k+5,j) = 30;
                       gait(k+4,j) = 60;
                        gait(k+3,j) = 30;
                   elseif(randi(3,1,1) == 2)             
                       gait(k+5,j) = 45;
                       gait(k+4,j) = 37;
                        gait(k+3,j) = 30;
                   elseif(randi(3,1,1) == 3)
                       gait(k+5,j) = 60;
                        gait(k+4,j) = 14;
                       gait(k+3,j) = 30;
                  end
            end
      end
     end
   t=t+1;
  
end  
 gait1 = gait;
end











