function variance = get_variance(w,s,p)
%%GET_VARIANCE given window size w, number of pairs s, success probability p,
%outputs  the variance of the waiting time for the process to finish

%first of all, calculated second moment

[W,N] = get_matrices_for_variance(w,s,p);

dim = nchoosek(w-1,s-1);
z = W'\ones(dim,1);

y = W'\(ones(dim,1) + N'*z);

%the expectation is given by
E = 1/sum(z);
second_moment = (1/2+E-sum(y)*E)/(sum(z)/2);
variance  = second_moment - E^2;

end

