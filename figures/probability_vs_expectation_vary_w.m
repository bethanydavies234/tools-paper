%make plot of dependence of expected waiting time on the success
%probability, for different valuaes of the window size

figure; hold on; box on
w_values = [4,6,8,10]; s = 4;
set(gca,'FontSize',20)
cmap = hot(); 

p_values = linspace(0.005,0.995,100);
expectation_values = zeros(1,length(p_values));
for J = 1:length(w_values)
    w = w_values(J);
    for I = 1:length(p_values)
        p = p_values(I);
        [exp_wt,outcome_dist] = get_values(w,s,p);
        expectation_values(I) = exp_wt;
    end
color = cmap(220-J*50,:);
plot(p_values,expectation_values,'LineWidth',3,'Color',color);
end

exp_inf_window = s*ones(1,length(p_values))./p_values;

plot(p_values,exp_inf_window,'k--','LineWidth',3)
xlabel('$p$','Interpreter','Latex','Fontsize',20)
legend({['$w$ = ',num2str(w_values(1))],['$w$ = ',num2str(w_values(2))],['$w$ = ',num2str(w_values(3))],['$w$ = ',num2str(w_values(4))],['$w = \infty$']},'Interpreter','Latex','Fontsize',24)
ylabel('$E(\tau_{(w,4)})$','Interpreter','Latex','Fontsize',20)
ylim([0,500])