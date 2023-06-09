function matrix = get_matrix(w,s,p)
%given w,s,p outputs the appropriate matrix for the martingale method 
%that we need to invert to get the ending probabilities of each pattern, as
%well as the expected waiting time to finish the process

Omega = get_ending_patterns(w,s);
dim = nchoosek(w-1,s-1);
matrix = zeros(dim+1);

%first row and col
matrix(1,[2:dim+1]) = ones(1,dim);
matrix([2:dim+1]',1) = -ones(dim,1);

%all other entries
for I = 1:dim
    A_I = Omega(I,:);
    for J = 1:dim
        A_J = Omega(J,:);
        matrix(I+1,J+1) = star(A_I,A_J,p);
    end
end

