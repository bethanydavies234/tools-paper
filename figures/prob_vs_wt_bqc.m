%plot minimum expected waiting time for one round of BQC, where we vary the success
%probability. 

%this takes a few minutes to run.

%function to capture rate-fidelity tradeoff inherent in entanglement
%generation
%e.g. 
C = 2; 
F_0 = @(p)(1-p/C); 

%choose graph
graph = [1,2;2,3;3,4;1,4];
%choose k-colouring
colouring = {[1,3],[2,4]};
%choose vector of p-values
p_values = linspace(0.04,0.1,100);
%s must match the number of vertices in the graph
s = 4;
%specify memory lifetimes
T_values = [30,40,50];
%vector to store expected times
expected_times = zeros(length(p_values),length(T_values)); 
%vector to store optimal w values
optimal_w_values = zeros(length(p_values),length(T_values));

%cycle between different memory lifetimes
for J = 1:length(T_values)
    T = T_values(J);
    for I = 1:length(p_values)
        p = p_values(I); 
        %find largest possible window size to satisfy average error condition
        initial_fidelity = F_0(p);
        [expected_times(I,J),optimal_w_values(I,J)] = min_exp_time(graph,colouring,s,p,T,initial_fidelity);
    end
end

cmap = copper();
figure; hold on; box on
set(gca,'FontSize',16)
for J = 1:length(T_values)
    color = cmap(256-85*(J-1),:);
    plot(p_values,expected_times(:,J),'LineWidth',2,'Color',color)
end
xlabel('$p$','Interpreter','Latex','Fontsize',16)
ylabel('minimum expected time','Interpreter','Latex','Fontsize',16)
legend({['$T = $ ',num2str(T_values(1))],['$T = $ ',num2str(T_values(2))],['$T = $ ',num2str(T_values(3))]},'Interpreter','Latex','Fontsize',14,'Location','northwest')
