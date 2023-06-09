function Omega = get_ending_patterns(w,s)
%given window size w and number of pairs s outputs the set Omega of possible 
%ending patterns, where we use the vector representation such that e.g.

%[2,5,7] = 1010011

%the output is ordered lexicographically
list = [2:w-s+2]';
if s>2
    for I = 3:s
        list = update_list(list,w-s+I);
    end
end
Omega = list;
end


