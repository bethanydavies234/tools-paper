%plot window size versus expected waiting time and compare with lower bound
%from infinite case, for different values of p

figure; hold on; box on
set(gca,'FontSize',20)

%note that need to also include standard deviation here
p_values = [0.2,0.3,0.4]; s = 4;
w_values = s:20;

%array to store expectations
expectations = zeros(length(p_values), length(w_values));
cmap = bone();
for J = 1:length(p_values)
    expectation_values = zeros(1,length(w_values));
    p = p_values(J);
    for I = 1:length(w_values)
        w = w_values(I); 
        [exp_wt,outcome_dist] = get_values(w,s,p);
        expectation_values(I) = exp_wt;
    end
    expectations(J,:) = expectation_values;
    color = cmap(256-J*65,:);
    plot(w_values,expectation_values,'LineWidth',3,'Color',color)
end

legend({['$p$ = ',num2str(p_values(1))],['$p$ = ',num2str(p_values(2))],['$p$ = ',num2str(p_values(3))],['$p$ = ',num2str(p_values(3))]},'Interpreter','Latex','Fontsize',20)
xlabel('$w$','Interpreter','Latex','Fontsize',24)
ylabel('$E(\tau_{(w,4)})$','Interpreter','Latex','Fontsize',24)

%now plot the infinite limits
for J = 1:length(p_values)
    p = p_values(J);
    color = cmap(210-J*60,:);
    plot(w_values,ones(length(w_values),1)*s/p,'--','LineWidth',3,'Color',color)
end

legend({['$p$ = ',num2str(p_values(1))],['$p$ = ',num2str(p_values(2))],['$p$ = ',num2str(p_values(3))]},'Interpreter','Latex','Fontsize',20)
xlim([s,max(w_values)])
ylim([0,100])