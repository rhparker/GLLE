% plot for solutions to GLLE equation
% data from AUTO

fs = 20;            % font size
lw = 2;             % line width
ms = 30;            % marker size

%% plot a CW solution

% data for CW solutions
load LLE1;

% index/label of solution to plot
ind = 5;

figure('DefaultAxesFontSize',fs);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

% bifurcation diagram plot
subplot(1,2,1);
hold on;
% plot bifurcation diagram
plot(bd.par, bd.L2norm, 'LineWidth', lw);
% plot marker showing place of solution on bifurcation diagram
plot(sols{ind}.P,sols{ind}.norm,'.', 'MarkerSize',ms);
title('bifurcation diagram');
xlabel('$P$');
ylabel('$\|u\|_{L_2}$');
 
% plot CW solution (real and imaginary parts, should be constant)
subplot(1,2,2);
plot( sols{ind}.t, sols{ind}.u(1:2, :), 'LineWidth', lw );
title('solution');
legend({'Re $u$' 'Im $u$'});
xlabel('$t$');
ylabel('$u$');

%% plot solution on one of the branches

% data for CW solutions and first two branches
load LLE1;
load LLEbranch2;
load LLEbranch3;

% index/label of solution to plot
ind = 15;

figure('DefaultAxesFontSize',fs);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

% bifurcation diagram plot
subplot(1,2,1);
hold on;
% plot bifurcation diagram, CW branch
plot(bd.par, bd.L2norm, 'LineWidth', lw);
% plot bifurcation diagram, next two branch
plot(bd2.par, bd2.L2norm, 'LineWidth', lw);
plot(bd3.par, bd3.L2norm, 'LineWidth', lw);
% plot marker showing place of solution on bifurcation diagram
plot(sols3{ind}.P,sols3{ind}.norm,'.', 'MarkerSize',ms);
title('bifurcation diagram');
xlabel('$P$');
ylabel('$\|u\|_{L_2}$');

% plot solution (real and imaginary parts)
subplot(1,2,2);
plot( sols3{ind}.t, sols3{ind}.u(1:2, :), 'LineWidth', lw );
title('solution');
legend({'Re $u$' 'Im $u$'});
xlabel('$t$');
ylabel('$u$');
