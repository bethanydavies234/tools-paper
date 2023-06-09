This folder contains functions to compute statistical quantities for the 
window problem. Throughout, w = window size, s = no. pairs required in 
window, p = success probability of individual Bernoulli trials

-- [exp_wt,outcome_dist] = get_values(w,s,p)
outputs the expected waiting time and ending pattern distribution. 
The ending pattern distribution is ordered lexicographically,
as in the outcome get_ending_patterns.

-- variance = get_variance(w,s,p)
outputs variance of waiting time 

-- Omega = get_ending_patterns(w,s)

outputs list of ending patterns, ordered lexicographically

-- matrix = get_matrix(w,s,p)

outputs matrix of star products for the martingale method.

-- output = star(B,C,p)

given two ending patterns B and C and Bernoulli trials with parameter p, 
calculates the star product between them

-- new_list = update_list(list,M)

used in get_ending_patterns

-- [W,N] = get_matrices_for_variance(w,s,p)
outputs the matrices necessary to find the variance of the waiting time
distribution. This is used in get_variance
