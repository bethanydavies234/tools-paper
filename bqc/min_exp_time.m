function [expected_time,w] = min_exp_time(graph,colouring,s,p,N,initial_fidelity)
%find the largest possible window size and minimum expected time to carry
%out the BQC protocol. Do this by finding the maximum possible value of w
%that still satisfies the average error condition

%s is number of pairs we want to generate, p is the success probability,
%decoherence is a function of the number of timesteps
%determining decoherence of fidelity in the server memory 
%(this is assumed to be constant for every qubit), F_0 is the initial
%fidelity of qubits after transmission.

%start from smallest possible value of the window size
w = s;
%NOTE: CHANGE k TO DEPEND ON ENTRIES FOR GRAPH AND COLOURING;
[~,k] = size(colouring);

%define fidelity function in terms of the number of timesteps, n
F = @(n)depol(n,initial_fidelity,N);
%ordering protocol OP is a map that tells us the order in which qubits are
%transferred to the server -  i.e. the first qubit to be transferred
%correponds to vertex OP(1), and the last qubit has vertex OP(s).
OP = @(k)k; 

%calculate initial waiting time and p_av for w=s
[waiting_time,p_av] = BQC_info(graph,colouring,F,w,s,p,OP);

%check if the threshold is satisfied if all qubits have fidelity F_0
fidelities = initial_fidelity*ones(s,1);
opt_p_av = average_error_prob(fidelities,graph,colouring);
if opt_p_av > 1/(2*k)
    disp(['not possible for p = ',num2str(p)])
    %set required maximum window size and corresponding expected time to
    %zero in this case
    w = 0; expected_time = 0;
elseif p_av > 1/2*k
    disp(['not possible for p = ',num2str(p),' and N = ',num2str(N)])
    w = 0; expected_time = 0;
else
   new_p_av = p_av;
   while new_p_av <= 1/(2*k) && w < 25
    w = w+1; 
    [new_waiting_time,new_p_av] = BQC_info(graph,colouring,F,w,s,p,OP); 
    if new_p_av <= 1/(2*k)
        waiting_time = new_waiting_time;
        p_av = new_p_av;
    end
    %disp(['success probability = ',num2str(p)])
    %disp(['try w = ',num2str(w)])
   end
   if w >= 25
    disp(['maximum w too large for p = ',num2str(p)]);
    expected_time = 0; w = 0;
   else
    expected_time = waiting_time;
   end
end

end

