%%
zeroes = [1/2, 0, 1/2]; 
poles = [1, 0, 0];           

figure(1)
zplane(zeroes, poles)        % Pole zero plot


x = linspace(0, 1/2, 500);
[H, w] = freqz(zeroes, poles, 500,'half');

figure(2)
subplot(2, 1, 1)
plot(w/(2*pi), abs(H))
title('Magnitude Response')
ylabel('dB')
xlim([0 1/2])

subplot(2, 1, 2)
plot(x, angle(H))
xlim([0 1/2])
ylabel('deg')
xlabel('f')