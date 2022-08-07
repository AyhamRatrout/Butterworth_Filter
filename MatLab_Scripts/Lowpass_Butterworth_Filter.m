%Reads data from the indicated file (the unfiltered owl sound in this case) and returns the sampled data (y) and the sampled rate for this data (Fs).
[y, Fs] = audioread('Owl_Unfiltered.m4a');

%Plays the unfiltered owl sound signal.
unfilteredPlayer = audioplayer(y, Fs);
play(unfilteredPlayer);

%Computes and plots the one-sided magnitude spectrum of the unfiltered signal using DFT.
yfft = abs(fft(y));
plot(yfft(1:7500));
pause(10);

%Constructs a spectrogram depicting the Fourier Transform of the unfiltered signal over time.
spectrogram(y, hamming(1000), 500, [], Fs, 'yaxis');
pause(10);

%Design the Butterworth filter.
N = 7;
Fc = 300;
[b, a] = butter(N, Fc / (Fs / 2), 'low');

%Computes and plots the frequency response (magnitude and frequency) of the above Butterworth Filter.
freqz(b, a);
pause(10);

%Filters the original signal using the above Butterworth Filter.
dataOut = filter(b, a, y);

%Computes and plots the one-sided magnitude spectrum of the filtered signal using DFT.
dfft = abs(fft(dataOut));
plot(dfft(1:7500));
pause(10);

%Constructs a spectrogram depicting the Fourier Transform of the filtered signal over time.
spectrogram(dataOut, hamming(1000), 500, [], Fs, 'yaxis');
pause(10);

%Plays the filtered owl sound signal.
filteredPlayer = audioplayer(dataOut, Fs);
play(filteredPlayer);

%Writes the filtered owl sound signal to a file named Owl_Filtered.wav
audiowrite('Owl_Filtered.wav', dataOut, Fs);