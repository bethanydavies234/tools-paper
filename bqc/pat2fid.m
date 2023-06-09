function fidelities = pat2fid(success_pattern,s,F,OP)
%given success pattern in vector form, the number of pairs we need to
%produce (s), function describing the decay of the fidelity in terms of the
%number of timesteps (F), and an ordering protocol, which tells us in which
%order the graph qubits are transferred to the server.

%an ordering_protocol OP is a 1:1 function from {1,...,s} to itself, where
%OP(k) = j means that the k'th qubit to be produced acts as the j'th
%vertex of the graph.
fidelities = zeros(1,s);
%fill the entry corresponding to the most recently generated qubit
fidelities(OP(1)) = F(0);

for I = 1:s-1
    fidelities(OP(I+1)) = F(success_pattern(I)-1);
end

end

