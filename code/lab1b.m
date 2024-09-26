[amp, f] = audioread("HQmusic.wav");
sec = length(amp)/f;
x = linspace(0, sec, length(amp));

%% Task 6 & 7
freq_dist = f/4;
A = 0.1;
distortion = (A*sin(2*pi*freq_dist*x))';

amp_distorted = amp + distortion;

Spectrum_PLOT(amp_distorted, f)

% Zeroes are placed at +-j according to prep 1a

load("test_filter.mat")
amp_filtered = filter(b,a,amp_distorted);

Spectrum_PLOT(amp_filtered, f);

%% Task 8

[disorted_music, Fs] = audioread("distorted_music\torn.wav");

[filtered_signal, zeros, b, a] = FIR_filter(disorted_music,3,Fs);

% soundsc(disorted_music,Fs)
Spectrum_PLOT(disorted_music,Fs)

soundsc(filtered_signal,Fs)
Spectrum_PLOT(filtered_signal,Fs)

Spectrum_DoublePLOT(disorted_music,filtered_signal,Fs)

%% Task 9

[IIR_filt_sign, zeros, poles, b, a] = IIR_filter(disorted_music,3,Fs);

soundsc(IIR_filt_sign,Fs)

%% Func Task 8
function [y1, y2] = zeroes(w)
    y1 = exp(1i*w);
    y2 = exp(-1i*w);
end

function [signal, zeros, b, a] = FIR_filter(signal, x, Fs)

    for i = 1:x
        [pxx,f]=periodogram(signal,[],1024,Fs,'centered');    
        pos_max = find(pxx == max(pxx));
        w = 2*pi*f(pos_max(2))/Fs;
        f(pos_max(2))
        [z_1, z_2] = zeroes(w);

        zeros(i*2-1) = z_1;
        zeros(i*2) = z_2;

        b = poly(zeros);
        a = 1;
        
        figure;
        zplane(b,a)

        signal = filter(b,a,signal);

        Spectrum_PLOT(signal,Fs)
    end
end

%% Func Task 9

function [p_1, p_2] = poles_95(w)
    p_1 = 0.95 * exp(1i*w);
    p_2 = 0.95 * exp(-1i*w);
end

function [signal, zeros, poles , b, a] = IIR_filter(signal, x, Fs)

    for i = 1:x
        [pxx,f]=periodogram(signal,[],1024,Fs,'centered');    
        pos_max = find(pxx == max(pxx));
        w = 2*pi*f(pos_max(2))/Fs;
        f(pos_max(2))

        [z_1, z_2] = zeroes(w);
        [p_1, p_2] = poles_95(w);

        zeros(i*2-1) = z_1;
        zeros(i*2) = z_2;

        poles(i*2-1) = p_1;
        poles(i*2) = p_2; 

        b = poly(zeros);
        a = poly(poles);
        
        if i == x
            figure;
            zplane(b,a)
        end

        signal = filter(b,a,signal);
        % Spectrum_PLOT(signal,Fs)
    end
end