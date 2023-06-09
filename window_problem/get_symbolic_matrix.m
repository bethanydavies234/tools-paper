function M = get_symbolic_matrix(w,s,p)
%given w,s,p outputs the appropriate matrix for the martingale method 
%that we need to invert to get the ending probabilities of each pattern, as
%well as the expected waiting time to finish the process

Omega = get_ending_patterns(w,s);
dim = nchoosek(w-1,s-1);
M = sym('M', [dim+1, dim+1]);

%first row and col
matrix(1,[2:dim+1]) = ones(1,dim);
matrix([2:dim+1]',1) = -ones(dim,1);

%all other entries
for I = 1:dim
    A_I = Omega(I,:);
    %build column
    for J = 1:dim
        A_J = Omega(J,:);
        a = num2str(A_I); b = num2str(A_J);
        entry_name = ['M',a,'_',b];
        genvarname(entry_name) = star(A_I,A_J,p);
    end
end
