%% Read Audio
[amp, f] = audioread("HQmusic.wav");

% Plot in time domain
sec = length(amp)/f;
x = linspace(0, sec, length(amp));
figure(1)
plot(x , amp)
xlabel("t")
ylabel("Amplitude")
title("Time domain plot")

% Plot power density spectrum
Spectrum_PLOT(amp, f)

%% Filter signal

filter = (1/5) * ones(5,1);

amp_f = conv(amp, filter);   % Convolution and removing transient
amp_f = amp_f(5:end);

Spectrum_PLOT(amp_f, f)

% soundsc(amp_f,f)

%% Adding noise
amp_rand = amp + 0.1*randn(length(x),1);

Spectrum_PLOT(amp_rand, f)

amp_rand_f = conv(amp_rand, filter);
amp_rand_f = amp_rand_f(5:end);

Spectrum_PLOT(amp_rand_f, f)

soundsc(amp_rand_f, f)