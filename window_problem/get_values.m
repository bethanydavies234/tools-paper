function [exp_wt,outcome_dist] = get_values(w,s,p)
%GET_VALUES given window size w, number of pairs s, success probability p,
%outputs  the expected waiting time for the process to finish as well as
%the outcome probabilities.

M = get_matrix(w,s,p);
[dim,~] = size(M);
v = [1,zeros(1,dim-1)]';
values = M\v;
exp_wt = values(1);
outcome_dist = values(2:end);
end

