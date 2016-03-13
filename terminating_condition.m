function [ output ] = terminating_condition(step_f)
output =0;
for i=1:6

  if((step_f(3,i) == 30 && step_f(2,i) == 90) || (step_f(3,i) == 45 && step_f(2,i) == 60) || (step_f(3,i) == 60 && step_f(2,i) == 30)) 
    output = 1;
    break;
  end
end

end

