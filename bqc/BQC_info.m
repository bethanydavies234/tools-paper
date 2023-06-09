function [waiting_time,average_error] = BQC_info(graph,colouring,F,w,s,p,OP)
%input graph and associated colouring, function that tells us how the
%fidelities decay with time, window problem parameters, ordering protocol
%OP.

%gives us 
%exp_wt: expected waiting time for the s qubits to be successfully
%present in the server 
%p_av: average probability of error of a test round.

%first of all, compute set of success pattern outcomes and their corresponding
%probability distribution

%get expected waiting time and outcome 
[waiting_time,outcome_dist] = get_values(w,s,p);
Omega = get_ending_patterns(w,s);

%once we know the ending pattern distribution, we can find the average
%probability of error of a test round.
average_error = 0;
[dim,~] = size(Omega);
for I = 1:dim
    %disp(['success pattern ',num2str(I)])
    success_pattern = Omega(I,:);
    new_prob = outcome_dist(I);
    fidelities = pat2fid(success_pattern,s,F,OP);
    average_error = average_error + new_prob*average_error_prob(fidelities,graph,colouring);
end

end

