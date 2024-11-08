D = 5;
alpha = 8/10;

zeroes = [1,0,0,0,0,alpha];
poles = 1;

[H, w] = freqz(zeroes,poles, 'half');


figure(1)
zplane(zeroes, poles);

figure(2)   % Plotting H(z)
plot(w, abs(H));
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('|H(e^{jω})|');

%%  Flipping zeroes and poles for 1/H(z)

[H_i, w_i] = freqz(poles, zeroes, 'half');

figure(3)
zplane(poles, zeroes);

figure(4)
plot(w_i, abs(H_i));
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('|H(e^{jω})|');