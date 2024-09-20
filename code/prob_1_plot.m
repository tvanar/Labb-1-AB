%% Problem 1
zeroes = [1/2, 0, 1/2]; 
poles = [1, 0, 0];           

figure(1)
zplane(zeroes, poles)        % Pole zero plot


x = linspace(0, 1/2, 500);
[H, w] = freqz(zeroes, poles, 500,'half');
figure(2)
subplot(2, 1, 1)
plot(w/(2*pi), abs(H))      % Plot Magnitude
title('Magnitude Response')
ylabel('mag')
xlim([0 1/2])

subplot(2, 1, 2)
plot(x, angle(H))           % Plot phase
title('Phase Response')
xlim([0 1/2])
ylabel('deg')
xlabel('f')

%% Problem 2
c = (1+0.95^2)/2;
zeroes = [1*0.9512,0,1*0.9512];
poles = [1*0.9512, 0 ,0.95^2*0.9512];
figure(3)
zplane(zeroes,poles)

x = linspace(0, 1/2, 500);
[H, w] = freqz(zeroes, poles, 500,'half');
figure(4)
subplot(2, 1, 1)
plot(w/(2*pi), abs(H))      % Plot Magnitude
title('Magnitude Response')
ylabel('mag')
xlim([0 1/2])

subplot(2, 1, 2)
plot(x, angle(H))           % Plot phase
title('Phase Response')
xlim([0 1/2])
ylabel('deg')
xlabel('f')