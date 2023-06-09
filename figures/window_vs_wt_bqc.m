%plot minimum expected waiting time for one round of BQC, where we vary the 
%window size

%input arbitrary function of the initial fidelity in terms of p to capture
%rate-fidelity tradeoff over one timestep
C = 2; 
F_0 = @(p)(1-p/C); 

%then calculate the optimal rate for a number of different values of the
%success probability:
graph = [1,2;2,3;3,4;1,4];
%choose k-colouring
colouring = {[1,3],[2,4]};
%choose vector of p-values
w_values = [4:15];
s = 4;
%specify memory lifetimes
T_values = [30,40,50];
OP = @(k)k;
%vector to store expected times
expected_times = zeros(length(w_values),length(T_values)); 
%vector to store optimal w values
optimal_p_values = zeros(length(w_values),length(T_values));
%cycle between different memory lifetimes
for J = 1:length(T_values)
    T = T_values(J);
    for I = 1:length(w_values)
        w = w_values(I);  
        
        %find largest possible window size to satisfy average error
        %condition.
        
        %here we use a slightly altered function to calculate the
        %average error prob so can later use the fzero function.
        average_error = @(p)average_error_depol(graph,colouring,w,s,p,T,F_0(p),OP);
        best_p_av = average_error(10^-6);
        if best_p_av >1/4 
            disp(['infeasible'])
        else
            opt_p = fzero(@(p)(average_error(p)-0.25),0.025);
            optimal_p_values(I,J) = opt_p;
            [expected_times(I,J),~] = get_values(w,s,opt_p);
        end
    end
end

%make plot
figure; hold on; box on
set(gca,'FontSize',14)
xlabel('$w$','Interpreter','Latex','Fontsize',16); ylabel('minimum expected time','Interpreter','Latex','Fontsize',16)
cmap = copper();

for J = 1:length(T_values)
    T = T_values(J);
    color = cmap(256-85*(J-1),:);
    if J == 1
        plot(w_values(1:8),expected_times(1:8,J)','LineWidth',2,'Color',color)
    else
        plot(w_values,expected_times(:,J)','LineWidth',2,'Color',color)
    end
end
ylim([0,20000])
xlim([4,15])

legend({['$T = $ ',num2str(T_values(1))],['$T = $ ',num2str(T_values(2))],['$T = $ ',num2str(T_values(3))]},'Interpreter','Latex','Fontsize',14,'Location','northwest')
