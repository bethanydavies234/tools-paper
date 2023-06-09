function output = true_ratio_fn(w,s,p)
%finds the value of (E(tau_(w,s))-E(tau_(infty,s)))/E(tau(w,s))

[exp_wt,~] = get_values(w,s,p);

output = (exp_wt - s/p)/(exp_wt);
end

