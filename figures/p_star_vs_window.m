%plot p_star for a range of w values

%firstly, do the plot for the true p_star
s = 4;
w_values_1 = [4:15];
desired_error = 0.02;
%store values of w_star in this vector
p_star_true = []; p_star = [];
%store values of w_star_ub
for I = 1:length(w_values_1)
    w = w_values_1(I);
    %find p_star
    error = @(p)(true_ratio_fn(w,s,p)-desired_error);
    p_star_true(end+1) = fzero(error,0.5);
end

%then find the bounds using epsilon function.
w_values_2 = [4:25];
for I = 1:length(w_values_2)
    w = w_values_2(I);
    %find p_star
    error = @(p)(epsilon_fn(w,s,p)-desired_error);
    p_star(end+1) = fzero(error,0.9);
end

figure; hold on; box on
plot(w_values_1,p_star_true,'rx','LineWidth',2); 
plot(w_values_2,p_star,'-','LineWidth',2,'color', [0 0.5 0])
set(gca,'FontSize',16)
legend('$p^*_{true}$','$p^*$','Interpreter','Latex','Fontsize',14)
ylabel('$p$','Interpreter','Latex','Fontsize',16)
xlabel('$w$','Interpreter','Latex','Fontsize',16)
ylim([0,1]); xlim([4,25])