%% Task 11
[audio, Fs] = audioread("speech3.wav");

sec = length(audio)/Fs;
t = linspace(0, sec, length(audio));

Traveltime = 50/340;
D = round(Traveltime*Fs);

alpha = 0.8;

echo_audio = zeros(length(audio), 1);

for i = D+1:length(audio)
    echo_audio(i) = audio(i) + audio(i-D);
end

figure(1)
plot(t, audio);
xlabel("Time")
ylabel("Amplitude")
title("")

figure(2)
plot(t, echo_audio)



