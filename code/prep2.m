D = 5;
alpha = 8/10;

zeroes = [1, zeros(1, D), alpha];
poles = 1;

[H, w] = freqz(zeroes,poles, 'half');



figure(1)   % Plotting H(z)
subplot(2,1,2);
zplane(zeroes, poles);

subplot(2,1,1);
plot(w, abs(H));
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('|H(e^{jω})|');

%%  Flipping zeroes and poles for 1/H(z)

[H_i, w_i] = freqz(poles, zeroes, 'half');

figure(2)
subplot(2,1,2);
zplane(poles, zeroes);

subplot(2,1,1);
plot(w_i, abs(H_i));
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('|H(e^{jω})|');