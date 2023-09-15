# tools-paper
Code used to make plots for paper 'Tools for the analysis of quantum protocols requiring state generation within a time window'. For the theory behind the code, see our paper at arXiv:2304.12673.

### Window problem
We provide code to compute the quantities of interest for the 
window problem. These are the expectation and variance of the waiting time and the ending pattern distribution.

The functions take in the following three parameters:

w = window size 
s = number of successes required in window
p = success probability s

[exp_wt,outcome_dist] = get_values(w,s,p)
outputs the expected waiting time and ending pattern distribution. 
The ending pattern distribution is ordered lexicographically,
as in the outcome get_ending_patterns.

variance = get_variance(w,s,p)
outputs variance of waiting time 

Omega = get_ending_patterns(w,s)

outputs list of ending patterns, ordered lexicographically.

### BQC
These files code allow one to compute the quantities related to BQC 

### Figures
The following scripts output the plots from the paper:
