function output = error_prob(fidelities,graph,trap)
%computes the error probability of a test round with trap colour given by
%the set of indices trap.

%graph is a matrix containing pairs corresponding to edges between the qubits
%1,...,s. Note that each pair must be written in increasing order
%trap is a vector containing the indices of each of the trap qubits;
%fidelities is a vector containing the fidelities of qubits 1,...,s.

s = length(fidelities);
success_prob = 0;
bin_strings = dec2bin(0:2^length(trap)-1)-'0';
dummy_qubits = setdiff(1:s,trap);

for j = 1:2^length(trap)
    %we add the next term corresponding to the j'th binary string 
    new_term = 1;
    x = bin_strings(j,:);
    %disp(['sum term = ',num2str(x)])
    %compute the new term, first part: for each of the trap qubits,
    %multiply by the corresponding fidelity factor
    for k = 1:length(trap)
        %disp(['trap qubit = ',num2str(trap(k))])
        new_term = new_term*fid(fidelities(trap(k)),x(k));
        %disp(['fidelity contribution = ',num2str(fid(fidelities(trap(k)),x(k)))])
    end
    
    %compute the new term: for each of the dummy qubits, find the
    %corresponding factor in the sum, which is determined by the
    %neighbouring trap qubits and the binary string x.
    for k = 1:(s-length(trap))
        
        dummy_qubit = dummy_qubits(k); %disp(['dummy = ',num2str(dummy_qubit)])
        has_trap_neighbour = 0;
        sum_index = 0;
        
        %now contribute the factors corresponding to the fidelities of the
        %dummy qubits 
        
        %find dummy qubit index
        
        for I = 1:length(trap)
            
            trap_qubit = trap(I);
            test_edge = sort([dummy_qubit,trap_qubit]);
            
            %check if this is an edge in the graph
            logicals = ismember(graph,test_edge,'rows');
            
            %if the trap qubit is indeed neighbouring the dummy in
            %question, the index from said trap corresponds to the index of
            %the dummy in the sum.
            if sum(logicals)>0
                has_trap_neighbour = 1;
                sum_index = mod(sum_index + x(I),2);
            end
        end
        
        if has_trap_neighbour == 1
            %find fidelity of dummy qubit
            logicals = ismember(1:s,dummy_qubit);
            index = find(logicals);
            new_term = new_term*(fid(fidelities(index),sum_index));
            %disp(['fidelity contribution = ',num2str(fid(fidelities(index),sum_index))])
        end
    end
    %we have finished calculating the term corresponding to said binary
    %string. now add to the success prob.
    success_prob = success_prob + new_term;
end
%finally we calculate the error probability
output = 1 - success_prob;
end


