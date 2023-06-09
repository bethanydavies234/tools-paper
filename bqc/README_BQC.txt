The following is a list of functions used to output BQC plots.

-- output = depol(n,F_0,T_param)

outputs the fidelity of a qubit state that has initial fidelity F_0 and undergoes depolarising noise for n timesteps,
with memory lifetime parameter T_param timesteps.

-- output = error_prob(fidelities,graph,trap)

compute error probability of a test round with a particular trap colour chosen, and pre-defined qubit fidelities.

-- output = average_error_prob(fidelities,graph,colouring)

given a vector of qubit fidelities, a graph and a colouring, calculate the average probability of error of a trap round

-- [waiting_time,average_error] = BQC_info(graph,colouring,F,w,s,p,OP)

outputs the expected waiting time for the s qubits to be successfully present in the server, and the average 
probability of error of a test round. 

-- [expected_time,w] = min_exp_time(graph,colouring,s,p,N,initial_fidelity)

find the largest possible window size and minimum expected time to carry 
out the BQC protocol. This is for the purpose of our plots, and assumes 
depolarising noise.

-- output = fid(F,x)

outputs F if x=0, and 1-F if x=1. This is needed to calculate the average error probability.

-- average_error = average_error_depol(graph,colouring,w,s,p,T,F_0,OP)

This is a function that is very similar to BQC_info. We use it to make a 
figure (see FIGURE NAME HERE), where the average error prob needs to be 
a direct function of p to use the MATLAB fzero function. 

INPUT graph, colouring, window problem parameters (w,s,p), memory
lifetime T, initial state fidelities F_0, ordering protocol OP
OUTPUT the average probability of test round failure in BQC, assuming
depolarising noise with memory lifetime T.