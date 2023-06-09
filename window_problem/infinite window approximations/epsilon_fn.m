function output = epsilon_fn(w,s,p)
%gives epsilon = prob(tau_(w,s)>w)

output = 0; q = 1-p;
for i = 0:(s-1)
    output = output + nchoosek(w,i)*q^(w-i)*p^i;
end

