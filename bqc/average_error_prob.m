function output = average_error_prob(fidelities,graph,colouring)
%given a vector of the fidelities, a graph and a colouring, we can calculate the
%average probability of error of a trap round.

%fidelities is a length-s vector containing the fidelities of qubits 1,...,s;
%graph is a matrix of pairs [j,k] denoting an edge between 
%vertex j and vertex k for j,k = 1,...,s;
%colouring is a 1 by K cell array containing K disjoint sets that have
%union {1,...,s} and form a colouring of the graph.


output = 0;

K = length(colouring);

for j = 1:K
    y = error_prob(fidelities,graph,cell2mat(colouring(j)));
    output = output + y;
end

output = output/K;
end

