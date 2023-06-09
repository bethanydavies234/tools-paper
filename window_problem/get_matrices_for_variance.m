function [W,N] = get_matrices_for_variance(w,s,p)
%outputs the matrices necessary to find the variance of the waiting time
%distribution.

%generate array of ending patterns
Omega = get_ending_patterns(w,s);

%generate the matrix W
dim = nchoosek(w-1,s-1);
W = zeros(dim);
for I = 1:dim
    A_I = Omega(I,:);
    for J = 1:dim
        A_J = Omega(J,:);
        W(I,J) = star(A_J,A_I,p);
    end
end

%generate the matrix N
N = zeros(nchoosek(w-1,s-1));
for I = 1:dim
    A_I = Omega(I,:);
    for J = 1:dim
        A_J = Omega(J,:);
        N(I,J) = overlap_new(A_J,A_I,p);
    end
end

end

