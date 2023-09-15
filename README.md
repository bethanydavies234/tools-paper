# tools-paper
Code used to make plots for paper 'Tools for the analysis of quantum protocols requiring state generation within a time window'. For the theory behind the code, see our paper at arXiv:2304.12673.

### Window problem
We provide code to compute the quantities of interest for the 
window problem. These are the expectation and variance of the waiting time and the ending pattern distribution.

The functions take in the following three parameters:

w = window size 
s = number of successes required in window
p = success probability s

[exp_wt,outcome_dist] = get_values(w,s,p): outputs the expected waiting time and ending pattern distribution. 
The ending pattern distribution is ordered lexicographically,
as in the outcome get_ending_patterns.

variance = get_variance(w,s,p): outputs variance of waiting time 

Omega = get_ending_patterns(w,s): outputs the ending patterns, ordered lexicographically

### BQC
We also provide code to produce the corresponding quantities for the analysis of BQC. For more details of the theoretical background, see Section IV-B of our paper, and the references therein. For examples of how to use these functions, see ... .

The main inputs here are

graph = MBQC graph for the blind computation
colouring = k-colouring chosen for the protocol.
F = function describing fidelity decay with time
(w,s,p)  = window problem parameters (see above). Note that s must be the number of vertices in the graph.
OP = ordering protocol that determines the order in which qubits from the graph are sent to the server.
initial_fidelity = initial fidelity of qubits when transmitted to the server.

-- [waiting_time,average_error] = BQC_info(graph,colouring,F,w,s,p,OP)

outputs the expected waiting time for s qubits to be successfully present in the server, and the average 
probability of error of a test round. 

-- [expected_time,w] = min_exp_time(graph,colouring,s,p,N,initial_fidelity)

find the largest possible window size and minimum expected time to carry 
out the BQC protocol. This is for the purpose of our plots, and assumes 
depolarising noise.




### Figures
The following scripts output the plots from the paper:
