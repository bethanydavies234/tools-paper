# tools-paper
Code used to make plots for paper 'Tools for the analysis of quantum protocols requiring state generation within a time window'. For the theory behind the code, see our paper at arXiv:2304.12673.

### Window problem
We provide code to compute the quantities of interest for the 
window problem. These are the expectation and variance of the waiting time and the ending pattern distribution. There is also a more detailed README file within the folder.

The functions take in the following three parameters:

```w``` = window size 

```s``` = number of successes required in window

```p``` = success probability

```get_values.m```: outputs the expected waiting time and ending pattern distribution. 
The ending pattern distribution is ordered lexicographically,
as in the outcome get_ending_patterns.

```get_variance.m```: outputs variance of waiting time 

```get_ending_patterns```: outputs the ending patterns, ordered lexicographically

### BQC
We also provide code to produce the corresponding quantities for the analysis of BQC. For more details of the theoretical background, see Section IV-B of our paper, and the references therein. For examples of how to use these functions, see the code to produce Figures 9 and 10. There is also a more detailed README file within the folder.

The main inputs:

```graph``` = MBQC graph for the blind computation

```colouring``` = k-colouring chosen for the protocol.

```w```/```s```/```p```  = window problem parameters (see above). Note that ```s``` must be the number of vertices in the graph.

```F``` = decoherence function (how qubit fidelities decay with time)

```T``` = memory lifetime for the noise model

Some examples of useful functions:

```BQC_info.m```: outputs the expected waiting time for s qubits to be successfully present in the server, and the average 
probability of error of a test round. 

```min_exp_time.m```: finds the largest possible window size and minimum expected time to carry 
out the BQC protocol. This is for the purpose of our plots, and assumes 
depolarising noise.

### Figures
The following scripts output the plots from the paper:

Figure 3: ```window_vs_expectation.m```

Figure 4: ```window_vs_expectation_vary_p.m```

Figure 5: ```probability_vs_expectation_vary_w.m```

Figure 6: ```w_star_vs_p.m```

Figure 7: ```p_star_vs_window.m```

Figure 9: ```prob_vs_wt_bqc.m```

Figure 10: ```window_vs_wt_bqc.m```
