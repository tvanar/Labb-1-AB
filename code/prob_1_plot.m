%% Problem 1
zeroes = [1/2, 0, 1/2]; 
poles = [1, 0, 0];           

figure(1)
zplane(zeroes, poles)        % Pole zero plot

x = linspace(0, 1/2, 500);
[H1, w] = freqz(zeroes, poles, 500,'half');
figure(2)
subplot(2, 1, 1)
plot(w/(2*pi), abs(H1))      % Plot Magnitude
title('Magnitude Response')
ylabel('mag')
xlim([0 1/2])

subplot(2, 1, 2)
plot(x, angle(H1))           % Plot phase
title('Phase Response')
xlim([0 1/2])
ylabel('rad')
xlabel('f')

%% Problem 2
zeroes_2 = [1*0.9512,0,1*0.9512];
poles_2 = [1*0.9512, 0 ,0.95^2*0.9512];
figure(3)
zplane(zeroes_2,poles_2)

[H2, w2] = freqz(zeroes_2, poles_2, 500,'half');
figure(4)
subplot(2, 1, 1)
plot(w2/(2*pi), abs(H2),'-', w/(2*pi), abs(H1), '--')      % Plot Magnitude
title('Magnitude Response')
ylabel('mag')
xlim([0 1/2])

subplot(2, 1, 2)
plot(x, angle(H2),'-', x, angle(H1), '--')           % Plot phase
title('Phase Response')
xlim([0 1/2])
ylabel('rad')
xlabel('f')
legend('H_2', 'H_1')