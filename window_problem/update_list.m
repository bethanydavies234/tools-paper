function new_list = update_list(list,M)
%this function is used in calc_values to generate the set Omega.
%Input a list of equal-length vectors (which we will change iteratively to
%generate Omega) and integer value M. For each element L of the list, we
%define a new element by adding a value k on the end. We do this for k =
%L(end),..., M. We add each new element to the new_list.
new_list = [];
[m,l] = size(list);

for I = 1:m
    L = list(I,:);
    for J = (L(end)+1):M
        new_list(end+1,:) = [L,J];
    end
end
end

