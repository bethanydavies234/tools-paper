%plot w_star for a range of p values

%firstly, do the plot for w_star
s = 4;

%these are the values we used in the plot. 
%use larger values of p if you want the code to run faster!
p_values = [0.2,0.3,0.4,0.5];

desired_error = 0.02;
%store values of w_star in this vector
w_star_true = []; w_star = [];
%store values of w_star_ub
for I = 1:length(p_values)
    p = p_values(I);
    %find w_star
    w = s;
    while true_ratio_fn(w,s,p) > desired_error
        w = w+1;
    end
    w_star_true(end+1) = w;
    
end

%then plot the upper bound for w_star
p_values_2 = linspace(0.05,0.5,99);
for I = 1:length(p_values_2)
    p = p_values_2(I);
    %find w_star
    w = s;
    while epsilon_fn(w,s,p) > desired_error
        w = w+1;
    end
    w_star(end+1) = w;
end

figure; hold on; box on;
set(gca,'FontSize',16)
plot(p_values,w_star_true,'rx','LineWidth',2)
plot(p_values_2,w_star,'-','LineWidth',2,'color', [0 0.5 0])
xlabel('$p$','Interpreter','Latex','Fontsize',16);
ylabel('$w$','Interpreter','Latex','Fontsize',16);
legend('$w^*_{true}$','$w^*$','Interpreter','Latex')
xlim([0,0.5]); ylim([0,175])
