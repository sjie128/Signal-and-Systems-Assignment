% Define numerator and denominator coefficients
num = [1 2];          % numerator: s + 2  (zero at s = -2)
den = [1 3 2];        % denominator: s^2 + 3s + 2  (poles at s = -1, -2)

% Compute zeros, poles, and gain without Control System Toolbox
zeros_H = roots(num);          % zeros of H(s)
poles_H = roots(den);          % poles of H(s)
k = num(1) / den(1);           % gain (ratio of leading coefficients)
% Get zeros, poles, and gain
% Get zeros, poles, and gain (no Control System Toolbox)
z = zeros_H;
p = poles_H;
% k was computed on line 8 and is the gain

% OR using roots directly
zeros_H  = roots(num)   % zeros of H(s)
poles_H  = roots(den)   % poles of H(s)

% Method 1 (disabled): creating tf and using pzmap requires toolboxes.
% The Control System Toolbox (or alternative listed toolboxes) is not available.
% figure;
% H = tf(num, den);
% pzmap(H)
% grid on
% title('Pole-Zero Map of H(s)')

% Method 2: manual plot (more control)
figure;
plot(real(z), imag(z), 'bo', 'MarkerSize', 10, 'LineWidth', 2)  % zeros = circles
hold on
plot(real(p), imag(p), 'rx', 'MarkerSize', 10, 'LineWidth', 2)  % poles = crosxline(0, 'Color', 'k', 'LineWidth', 0.5)   % real axis
xline(0, 'Color', 'k', 'LineWidth', 0.5)   % real axis
yline(0, 'Color', 'k', 'LineWidth', 0.5)    % imaginary axis
xlabel('Real Axis (σ)')
ylabel('Imaginary Axis (jω)')
title('Pole-Zero Plot of H(s)')
legend('Zeros (O)', 'Poles (X)')
grid on