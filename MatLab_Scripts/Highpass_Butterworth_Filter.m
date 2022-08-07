%Reads data from the indicated file (the unfiltered birds sound in this case) and returns the sampled data (y) and the sampled rate for this data (Fs).
[y, Fs] = audioread('Birds_Unfiltered.m4a');

%Plays the unfiltered birds sound signal.
unfilteredPlayer = audioplayer(y, Fs);
play(unfilteredPlayer);

%Computes and plots the one-sided magnitude spectrum of the unfiltered signal using DFT.
yfft = abs(fft(y));
plot(yfft(1:75000));
pause(10);

%Constructs a spectrogram depicting the Fourier Transform of the unfiltered signal over time.
spectrogram(y, hamming(1000), 500, [], Fs, 'yaxis');
pause(10);

%Design the Butterworth filter.
N = 8;
Fc = 1850;
[b, a] = butter(N, Fc / (Fs / 2), 'high');

%Computes and plots the frequency response (magnitude and frequency) of the above Butterworth Filter.
freqz(b, a);
pause(10);

%Filters and aplifies the original signal using the above Butterworth Filter.
dataOut = 5 * filter(b, a, y);

%Computes and plots the one-sided magnitude spectrum of the filtered signal using DFT.
dfft = abs(fft(dataOut));
plot(dfft(1:75000));
pause(10);

%Constructs a spectrogram depicting the Fourier Transform of the filtered signal over time.
spectrogram(dataOut, hamming(1000), 500, [], Fs, 'yaxis');
pause(10);

%Plays the filtered bird sound signal.
filteredPlayer = audioplayer(dataOut, Fs);
play(filteredPlayer);

%Write filtered audio to a file named Birds_Filtered.wav
audiowrite('Birds_Filtered.wav', dataOut, Fs);