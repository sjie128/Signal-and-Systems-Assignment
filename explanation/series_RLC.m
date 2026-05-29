% Series RLC: H(s) = s / (s^2 + (R/L)s + 1/LC)
R = 10;       % ohms
L = 0.1;      % henrys
C = 0.001;    % farads

num = [1 0];                        % zero at s = 0
den = [1, R/L, 1/(L*C)];           % characteristic equation

% Compute zeros and poles without Control System Toolbox
z = roots(num);            % zeros from numerator polynomial
p = roots(den);            % poles from denominator polynomial
k = [];                    % no explicit gain computed here
H_exists_control = false;  % flag indicating toolbox not used


% Display transfer function (plain MATLAB, no toolbox)
disp('Transfer Function H(s):')
H = @(s) polyval(num, s) ./ polyval(den, s);   % function handle H(s) = s/(s^2 + (R/L)s + 1/(L*C))

% Use previously computed zeros and poles (lines 10-11)
fprintf('Zeros: '); fprintf('%.4f ', z); fprintf('\n');
fprintf('Poles: '); for ii = 1:numel(p), fprintf('%.4f%+.4fi ', real(p(ii)), imag(p(ii))); end, fprintf('\n');

% Plot pole-zero map without Control System Toolbox
figure;
plot(real(z), imag(z), 'ro', 'MarkerSize', 8, 'LineWidth', 2); hold on;
plot(real(p), imag(p), 'bx', 'MarkerSize', 8, 'LineWidth', 2);
xlabel('Real Axis'); ylabel('Imaginary Axis');
title('RLC Circuit - Pole-Zero Map (no toolbox)');
legend('Zeros','Poles'); grid on; axis equal;

title('Pole-Zero Map with Damping Grid')