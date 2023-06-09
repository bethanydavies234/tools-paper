%plot window size versus expected waiting time and compare with lower bound
%from infinite case

figure; hold on; box on
set(gca,'FontSize',14)

p = 0.5; s = 4;
w_values = s:15;
expectation_values = zeros(1,length(w_values));
stds = zeros(1,length(w_values));

for I = 1:length(w_values)
    w = w_values(I);
    [exp_wt,outcome_dist] = get_values(w,s,p);
    expectation_values(I) = exp_wt;
    stds(I) = sqrt(get_variance(w,s,p));
end


bounds = zeros(2,length(w_values));

curve2 = expectation_values+stds;
curve1 = expectation_values-stds;

x2 = [w_values, fliplr(w_values)];

plot(w_values,expectation_values,'r','LineWidth',3)
exp_inf_window = ones(1,length(w_values))*s/p;
plot(w_values,exp_inf_window,'b--','LineWidth',3)


plot(w_values,curve1,'k','LineWidth',3)
plot(w_values,curve2,'k','LineWidth',3)

xlabel('$w$','Interpreter','Latex','Fontsize',14)
ylabel('time steps','Interpreter','Latex','Fontsize',14)

inBetween = [curve1, fliplr(curve2)];
fill(x2, inBetween, [.8 .8 .8]);
plot(w_values,expectation_values,'r','LineWidth',2)
plot(w_values,exp_inf_window,'b--','LineWidth',2)
xlim([s,max(w_values)])
legend({'$E(\tau_{(w,4)})$','$E(\tau_{(\infty,4)})$'},'Interpreter','latex','Fontsize',14)
