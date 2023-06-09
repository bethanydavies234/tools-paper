function output = depol(n,F_0,T_param)
%tells us the fidelity of our state after undergoing depolarising noise for
%n timesteps.
output = (F_0-1/2)*exp(-n/T_param) + 1/2;
end

