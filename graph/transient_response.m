%  RLC Circuit Transient Current Response i(t)
%  Series RLC: R=20Ω, L=0.5H, C=200μF
%  Input: vs(t) = 100u(t) V
%  Initial conditions: i(0)=0, vC(0)=0

clc;        % clear command window
clear;      % clear all variables
close all;  % close any open figures

set(groot, 'DefaultTextColor', 'black');
set(groot, 'DefaultAxesXColor', 'black');
set(groot, 'DefaultAxesYColor', 'black');
set(groot, 'DefaultAxesTitleFontWeight', 'bold');
set(groot, 'DefaultAxesColor', 'black');
set(groot, 'DefaultFigureColor', 'black');

R = 20;             % Resistance (Ω)
L = 0.5;            % Inductance (H)
C = 200e-6;         % Capacitance (F)
V = 100;            % Step voltage (V)

alpha   = R / (2*L);             % Damping coefficient
omega0  = 1 / sqrt(L*C);        % Natural frequency (rad/s)
omegaD  = sqrt(omega0^2 - alpha^2); % Damped frequency (rad/s)
zeta    = alpha / omega0;        % Damping ratio

% Display parameters in command window
fprintf('   RLC Circuit Parameters    \n');
fprintf('Damping coefficient  α  = %.4f\n', alpha);
fprintf('Natural frequency   ω₀  = %.4f rad/s\n', omega0);
fprintf('Damped frequency    ωd  = %.4f rad/s\n', omegaD);
fprintf('Damping ratio        ζ  = %.4f\n', zeta);

% Determine damping condition
if zeta < 1
    fprintf('Damping Condition: UNDERDAMPED (ζ < 1)\n\n');
elseif zeta == 1
    fprintf('Damping Condition: CRITICALLY DAMPED (ζ = 1)\n\n');
else
    fprintf('Damping Condition: OVERDAMPED (ζ > 1)\n\n');
end

t = 0 : 0.0001 : 0.5;   % 0 to 0.5 seconds, step 0.1ms

% i(t) = (V / (L * omegaD)) * e^(-alpha*t) * sin(omegaD*t)
i_t = (V / (L * omegaD)) .* exp(-alpha .* t) .* sin(omegaD .* t);

figure('Color', 'white', 'Position', [100 100 850 500]);

subplot(2,1,1);
plot(t, i_t, 'b', 'LineWidth', 2);
hold on;
envelope =  (V / (L * omegaD)) .* exp(-alpha .* t);
plot(t,  envelope, 'r--', 'LineWidth', 1.2);
plot(t, -envelope, 'r--', 'LineWidth', 1.2);

[i_peak, idx_peak] = max(i_t);
plot(t(idx_peak), i_peak, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(t(idx_peak)+0.005, i_peak, ...
    sprintf('  Peak = %.3f A\n  at t = %.4f s', i_peak, t(idx_peak)), ...
    'FontSize', 9, 'Color', 'r');
xlabel('Time (s)', 'FontSize', 11,'FontWeight', 'bold', 'Color', '#1a3a5c');
ylabel('Current  i(t)  [A]', 'FontSize', 11,'FontWeight', 'bold', 'Color', '#1a3a5c');
title('RLC Transient Current Response  i(t) = 2.041·e^{-20t}·sin(97.98t)', ...
      'FontSize', 12, 'FontWeight', 'bold', 'Color', '#1a3a5c');
legend('i(t) response', 'Decay envelope +', 'Decay envelope −', ...
       'Peak current', 'Location', 'northeast');
grid on;
xlim([0 0.5]);
yline(0, 'k--', 'LineWidth', 0.8);

annotation('textbox', [0.40 0.55 0.50 0.06], ...
    'String', sprintf('α = %.1f   |   ω₀ = %.1f rad/s   |   ωd = %.2f rad/s   |   ζ = %.1f  → Underdamped', ...
    alpha, omega0, omegaD, zeta), ...
    'FontSize', 8, 'Color', 'black', ...
    'BackgroundColor', '[0.95 0.98 1]', ...
    'EdgeColor', '[0.3 0.5 0.8]', ...
    'FitBoxToText', 'on', 'HorizontalAlignment', 'center');

% i(t) graph
subplot(2,1,2);
plot(t, i_t, 'm', 'LineWidth', 2);  
xlabel('Time (s)', 'FontSize', 11,'FontWeight', 'bold', 'Color', '#1a3a5c');
ylabel('Current  i(t)  [A]', 'FontSize', 11,'FontWeight', 'bold', 'Color', '#1a3a5c');
title('Verification', ...
      'FontSize', 12, 'FontWeight', 'bold', 'Color', '#1a3a5c');
grid on;
xlim([0 0.5]);
yline(0, 'k--', 'LineWidth', 0.8);
legend('analytical i(t)', 'Location', 'northeast');

sgtitle('Series RLC Circuit  |  R=20Ω  L=0.5H  C=200μF  V=100V', ...
        'FontSize', 13, 'FontWeight', 'bold', 'Color', '#1a3a5c');

num = [1 0];             
den = [L R 1/C];          

% Zeros and Poles
z = roots(num);         
p = roots(den);         

figure('Color','white','Position',[960 100 480 420]);
plot(real(z), imag(z), 'bo', 'MarkerSize',8, 'LineWidth',1.5); hold on;
plot(real(p), imag(p), 'rx', 'MarkerSize',8, 'LineWidth',1.5);
xlabel('Real Axis'); ylabel('Imaginary Axis');
title('Pole-Zero Map of H(s)','FontSize',12,'FontWeight','bold', 'Color', '#1a3a5c');
legend('Zeros','Poles','Location','best');
grid on; axis equal;
ax = axis;

plot([ax(1) ax(2)], [0 0], 'k--', 'LineWidth',0.8);
plot([0 0], [ax(3) ax(4)], 'k--', 'LineWidth',0.8);

grid on;

% output at command window
p = roots(den);
fprintf('   Poles of H(s)   \n');
fprintf('s1 = %.4f + %.4fj\n', real(p(1)), imag(p(1)));
fprintf('s2 = %.4f + %.4fj\n', real(p(2)), imag(p(2)));