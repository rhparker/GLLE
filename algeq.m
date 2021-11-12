% plot L2 norm of CW (constant) solutions vs P
% data from AUTO

load algeq;

fs = 20;            % font size
lw = 2;             % line width
ms = 30;            % marker size

figure('DefaultAxesFontSize',fs);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

plot(bd.P, bd.L2norm, 'LineWidth', lw);
title('Continuous wave (CW) solution');
xlabel('$P$');
ylabel('$\|u\|_{L_2}$');
