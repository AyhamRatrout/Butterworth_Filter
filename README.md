# Butterworth Filter Design

## Problem Statement:
Noise is all around us and more often than not, noise interferes with the some of the beautiful sounds that we are trying to listen to and perhaps even record. Therefore, it is often desirable to be able to extract the unwanted sounds (noise) from the ones that we are interested in. Now, as complex as sound filtering and processing may seem, the two were made easy all thanks to some of the modern tools and software available to us. With that said, in order to be able to take advantage of these tools, one needs to have a good understanding of the ins and outs as well as the caveats of sound filtering, sampling, and processing both on theoretical and practical levels. Therefore, the purpose of this project is to allow myself to learn some of the common analysis and design techniques to solving two of the most practical filter design problems, designing lowpass and highpass filters. 

## Objectives:
The main objectives of this project were to take a deep dive into some of the common analysis and design techniques to solving two practical filter design problems as well as improve my theoretical and practical understanding of some of the concepts related to signals and systems sych as: Fourier Transforms, Filtering, and Sampling. To ensure the previously mentioned objectives are achieved, I decided to use MATLAB to design two types of Butterworth filters: a lowpass Butterworth filter and a highpass Butterworth filter. The lowpass Butterworth filter was used to eliminate the sound of a utility vehicle’s backup beeper from that of a great horned owl’s hoots whereas the highpass Butterworth filter was used to eliminate the sound of a flying jet from that of a number of birds chirping. With that said, the main challenge I set for myself was to design filters that are able to, effectively, eliminate the unwanted noise from the beautiful sounds of nature while still maintaining a minimal order.

## Technique and Aproach:
### 1. Lowpass Filter Design:
For the purpose of this part of the project, I concluded that I had to design and implement a lowpass Butterworth filter in order to eliminate the high frequency “annoying sound of a backup beeper of a utility vehicle” from the beautiful hoots of a great horned owl. In order to accomplish this, I carried out the following procedure. First, I went ahead and used MATLAB’s audioread() function in order to read the unfiltered owl sound file. Byy doing so, I was able to store the sampled data in a variable named y as well as store the sampling rate of this data in another variable named Fs. Once I had extracted the data I needed from the sound file, I went ahead and used MATLAB’s play() function in order to play the unfiltered owl sound as to have a basis of comparison between the unfiltered and filtered sounds of the owl. After playing the unfiltered sound signal, I needed to find a way to compute its discrete Fourier transform in order to plot the single-sided magnitude spectrum of this unfiltered signal. To accomplish this, I used MATLAB’s fft() function, which calculates the discrete Fourier transform of an input signal using a fast Fourier transform, as well as the plot() function in order to display the resulting Fourier representation. The resulting single-sided magnitude spectrum plot can be found in the "Lowpass Filter Design" portion of the "Measurements and Results" section of this README file. With that said, the single-sided magnitude spectrum of the unfiltered owl sound signal did not prove all that helpful as the interfering signal components are time varying. To get around that, I went ahead and used MATLAB’s spectrogram() function in order to construct a spectrogram depicting the Fourier Transform of the unfiltered owl sound signal over time. The resulting spectrogram can be found in the "Lowpass Filter Design" portion of the "Measurements and Results" section of this README file. After obtaining the unfiltered owl sound signal’s spectrogram, I had a pretty clear idea as to what the cutoff frequency of the Butterworth filter should be as well as the range of numbers from which the Butterworth filter’s order should be chosen. Upon inspection of the spectrogram, I noticed that the owl’s hoots have a frequency as high as 300Hz and therefore, all frequencies beyond 300Hz are to be eliminated (filtered out) hence why I chose my cutoff frequency (Fc) to be 300Hz. Furthermore, I started out by setting the order of the Butterworth filter at 3 (third order filter) however, the sound quality of the hoots was not all that great and I was still able to hear some echoing of the backup beeper happening in the background. For that reason, I decided to increase the order of my Butterworth filter to 5 (fifth order) which seemed to eliminate any background echoing of the backup beeper. With that said, the hoots of the owl were quieter than they should have been and for that reason I decided to, yet again, increase the order of the Butterworth filter in an attempt to make the hoots of the owl a little louder and easier to hear. While experimenting with that, I was able to conclude that the best sound quality for the owl hoots occurred when the order of the Butterworth filter was at 7 (seventh order) or 8 (eighth order). With that said, to make my final decision on what the order of the Butterworth filter should be, I kept changing the order of the Butterworth filter back and forth between 7 and 8, all while listening closely to the owl hoots, in an attempt to see if there are any noticeable differences between the two. After conducting that experiment, I was unable to hear and or detect any noticeable differences in the quality of the sound of the owl hoots. Therefore, since the goal I have set for myself for this project is to design a minimal order Butterworth filter, I decided to go with 7 as the order of my Butterworth filter. After designing a 7th order Butterworth filter, I went ahead and used MATLAB’s freqz() function in order to compute and plot the frequency response (both magnitude and frequency) of my designed Butterworth filter. With that said, I was satisfied with the plots I obtained for the frequency response of my Butterworth filter as they seemed to be appropriate to the purpose the filter was designed for. Furthermore, the resulting frequency response plots of my Butterworth filter can be found in the "Lowpass Filter Design" portion of the "Measurements and Results" section of this README file. After designing the Butterworth filter and inspecting its frequency response plots, I went ahead and used MATLAB’s filter() function to apply the Butterworth filter I designed to the unfiltered owl sound signal and save the resultant signal in a variable called dataOut. By doing so, I was able to filter the owl sound signal thus eliminating the high frequency “annoying sound of a backup beeper of a utility vehicle” and keeping the beautiful hoots of the great horned owl. After obtaining the output signal (by filtering the unfiltered signal), I went ahead and constructed the single-sided magnitude spectrum of the filtered signal (the output signal) using the fft() and plot() commands before constructing the spectrogram depicting the Fourier transform of the filtered signal over time using the spectrogram() command. This, in turn, allowed me to visually compare the unfiltered and filtered signals to one another thus better understand the effects of applying a lowpass Butterworth filter to a signal. Furthermore, the plots of both the single-sided magnitude spectrum of the filtered signal as well as the spectrogram of the Fourier transform of that filtered signal can both be found in the "Lowpass Filter Design" portion of the "Measurements and Results" section of this README file. Finally, I went ahead and used MATLAB’s audioplayer() and play() functions to play the resulting filtered signal thus allowing me to listen to the beautiful hoots of the great horned owl without that annoying sound of a backup beeper of a utility vehicle. With that said, I was rather satisfied with the results I obtained and therefore went ahead and used MATLAB’s audiowrite() command to write (store) the filtered sound of the great horned owl to a file named Owl_Filtered.wav, which is included in this repository.

### 2. Highpass Filter Design:
For the purpose of this part of the project, I concluded that I had to design and implement a highpass Butterworth filter in order to eliminate the low frequency jet noise from the pleasant sounds of birds chirping. In order to accomplish this, I carried out the following procedure. First, I went ahead and used MATLAB’s audioread() function in order to read the unfiltered birds sound file. By doing so, I was able to store the sampled data in a variable named y as well as store the sampling rate of this data in another variable named Fs. Once I had extracted the data I needed from the sound file, I went ahead and used MATLAB’s play() function in order to play the unfiltered chirps of the birds as to have a basis of comparison between the unfiltered and filtered sounds of the birds’ chirps. After playing the unfiltered sound signal, I needed to find a way to compute its discrete Fourier transform in order to plot the single-sided magnitude spectrum of this unfiltered signal. To accomplish this, I used MATLAB’s fft() function, which calculates the discrete Fourier transform of an input signal using a fast Fourier transform, as well as the plot() function in order to display the resulting Fourier representation. The resulting single-sided magnitude spectrum plot can be found in the “Highpass Filter Design” portion of the “Measurements and Results” section of this README file. With that said, the single-sided magnitude spectrum of the unfiltered chirping birds sound signal did not prove all that helpful as the interfering signal components are time varying. To get around that, I went ahead and used MATLAB’s spectrogram() function in order to construct a spectrogram depicting the Fourier Transform of the unfiltered chirping birds sound signal over time. The resulting spectrogram can be found in the “Highpass Filter Design” portion of the “Measurements and Results” section of this README file. After obtaining the unfiltered chirping birds sound signal’s spectrogram, I had a pretty clear idea as to what the cutoff frequency of the Butterworth filter should be as well as the range of numbers from which the Butterworth filter’s order should be chosen. Upon inspection of the spectrogram, I noticed that the chirps of the birds have a frequency as low as 1850Hz and therefore, all frequencies below 1850Hz are to be eliminated (filtered out) hence why I chose my cutoff frequency (Fc) to be 1850Hz. Furthermore, I started out by choosing the order of the Butterworth filter to be 3 (third order filter) however, the sound quality of the chirps was not all that great as I was able to hear some unpleasant background noise not to mention how quiet the chirps of the birds were. Therefore, I went ahead and increased the order of my Butterworth filter to 5 (fifth order) which seemed to get rid of some of that background noise/static but did not help much with how quiet the birds/ chirps were. For that reason, I decided to, yet again, increase the order of my Butterworth filter in an attempt to make the chirps of the birds a little louder and easier to hear. While experimenting with that, I was able to conclude that the best sound quality for the chirps of the birds occurred when the order of the Butterworth filter was at 8 (eighth order) although 7th and 9th order Butterworth filters performed just as well. After designing the 8th order Butterworth filter, I went ahead and used MATLAB’s freqz() function in order to compute and plot the frequency response (both magnitude and frequency) of my designed Butterworth filter. With that said, I was satisfied with the plots I obtained for the frequency response of my Butterworth filter as they seemed to be appropriate to the purpose the filter was designed for. Furthermore, the resulting frequency response plots of my Butterworth filter can be found in the “Highpass Filter Design” portion of the “Measurements and Results” section of this README file. After designing the Butterworth filter and inspecting its frequency response plots, I went ahead and used MATLAB’s filter() function to apply the Butterworth filter I designed to the unfiltered birds sound signal and save the resultant signal in a variable called dataOut. By doing so, I was able to filter the birds sound signal thus eliminating the low frequency jet noise from the pleasant sounds of birds chirping. Furthermore, it is important to note that I ended up amplifying the filtered signal, before storing it to dataOut, by a factor of 5 as to make the chirps of the birds sound as natural as possible. After obtaining the output signal (by filtering the unfiltered signal), I went ahead and constructed the single-sided magnitude spectrum of the filtered signal (the output signal) using the fft() and plot() commands before constructing the spectrogram depicting the Fourier transform of the filtered signal over time using the spectrogram() command. This, in turn, allowed me to visually compare the unfiltered and filtered signals to one another thus better understand the effects of applying a highpass Butterworth filter to a signal. Furthermore, the plots of both the single-sided magnitude spectrum of the filtered signal as well as the spectrogram of the Fourier transform of that filtered signal can both be found in the “Highpass Filter Design” portion of the “Measurements and Results” section of this README file. Finally, I went ahead and used MATLAB’s audioplayer() and play() functions to play the resulting filtered signal thus allowing me to listen to the pleasant chirps of the birds without that annoying sound of the jet flying overhead. With that said, I was rather satisfied with the results I obtained and therefore went ahead and used MATLAB’s audiowrite() command to write (store) the filtered sound of the birds chirping to a file named Birds_Filtered.wav, which is included in this repository.
  
## Measurements and Results:
### 1. Lowpass Filter Design:
In the “Lowpass Filter Design” portion of the “Measurements and Results” section of this README file, I will be showing and discussing the results I obtained while in the process of designing the lowpass Butterworth filter. After computing the discrete Fourier Transform of the unfiltered owl sound signal using MATLAB’s fft() function, I went ahead and used MATLAB’s plot() function to plot the resulting single-sided magnitude spectrum of this unfiltered sound signal. The plot I obtained is as seen below.

![Owl_Unfiltered_Single_Sided_Magnitude_Spectrum](https://github.com/AyhamRatrout/Butterworth_Filter/blob/master/Measurements_And_Results/Owl_Unfiltered_Single_Sided_Magnitude_Spectrum.png)


As one can see from the plot above, the single-sided magnitude spectrum of the unfiltered owl sound signal does not prove to be all that helpful as the interfering signal components are time varying. Therefore, to get around that, I went ahead and used MATLAB’s spectrogram() function in order to construct a spectrogram depicting the Fourier Transform of the unfiltered owl sound signal over time. The spectrogram I obtained is as shown below.

Now, after designing the lowpass 7th order Butterworth Filter, I went ahead and plotted the frequency response (magnitude and phase) of my designed filter. In order to accomplish this, I used MATLAB’s freqz() function to obtain a plot for the frequency response of my designed Butterworth filter. The plots I obtained are as shown below.

Finally, after I was done filtering the owl sound signal, I went ahead and constructed the single-sided magnitude spectrum of the filtered owl sound signal (the output signal) using the fft() and plot() commands before constructing the spectrogram depicting the Fourier transform of the filtered signal over time using the spectrogram() command. The resulting plots can be seen below.

  
### 2. Highpass Filter Design:

## Concluding Remarks:
In conclusion, my results turned out to be in line with the objectives I have set forth for myself for the purpose of this project. I was able to, completely, filter out the sound of a utility vehicle’s backup beeper from that of a great horned owl’s hoots using a 7th order lowpass Butterworth filter. Similarly, I was able to, completely, filter out the sound of a flying jet from the that of a group of birds chirping using an 8th order highpass Butterworth filter. Therefore, it is safe to claim that I was able to achieve the objective of eliminating the unwanted noises in the unfiltered sound files I have using the appropriate, minimal order Butterworth filters in addition to the signals and systems knowledge I have acquired throughout my education.  
