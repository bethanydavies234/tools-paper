function average_error = average_error_depol(graph,colouring,w,s,p,T,F_0,OP)
%
%input graph, colouring, window probalem parameters (w,s,p), memory
%lifetime T, 
F = @(n)depol(n,F_0,T);
[~,average_error] = BQC_info(graph,colouring,F,w,s,p,OP);
end

