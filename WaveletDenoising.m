clc;
clear all; 
close all;

fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 40 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData0Watt = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data0Watt = readData{1,2}(:,1);
y2Data0Watt = readData{1,3}(:,1);


fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 40 cm from center Light blanket shield dBm.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData0dBm = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data0dBm = readData{1,2}(:,1);
y2Data0dBm = readData{1,3}(:,1);

    
fid = fopen('E:\EMF\Data Sergio\Distance from center\No shield\Transpose Hann Transmitter 10 dBm 40 cm from center No shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
FrequencyNoShieldWatt = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
MaxNoShieldWatt = readData{1,2}(:,1);
AverageNoShieldWatt = readData{1,3}(:,1);


fid = fopen('E:\EMF\Data Sergio\Distance from center\No shield\Transpose Hann Transmitter 10 dBm 40 cm from center No shield dBm.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
FrequencyNoShielddBm = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
MaxNoShielddBm = readData{1,2}(:,1);
AverageNoShielddBm = readData{1,3}(:,1);

fid = fopen('E:\EMF\Data Sergio\Distance from center\Wavelet\WaveletCoef5xAxis.csv');
readData = textscan(fid,'%f','HeaderLines', 1,'Delimiter',',');
FrequencyWavelet = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 

[c,l]=wavedec(y2Data0Watt,5,'db2');
LightMaxWavelet = appcoef(c,l,'db2');

[c,l]=wavedec(AverageNoShieldWatt,5,'db2');
AverageNoShieldWattWavelet = appcoef(c,l,'db2');
%[d1,d2,d3,d4] = detcoef(c,l,[1,2,3,4]);
[d1,d2,d3,d4,d5] = detcoef(c,l,[1,2,3,4,5]);

%Wavelet Denoising
%Decompose the signal using Discrete Wavelet Transform
dwtmode('per','nodisplay');
wname = 'sym6';
level = 5;
[C,L] = wavedec (y2Data0Watt,level,wname);
%plotDetCoefHelper(y1Data0Watt,C,L); %helper function to plot the coefficeints at every level

% Analyze the subbands and determine the threshold

%Denoise the signal
fd = wden(y2Data0Watt,'rigrsure','s','sln',level,wname);  % (The noisy signal, the technique used, soft thresholding, single estimate of noise, decomposition level, the wavename)

%Shielding Effectiveness equations
PLight = ((AverageNoShieldWatt)./(y2Data0Watt));
SELight = (10 * log10(PLight));
PercentageSEL= (100- 10.^(-SELight/10));

%Shielding Effectiveness equations wavelet
PLightWavelet = abs((AverageNoShieldWattWavelet)./(LightMaxWavelet));
SELightWavelet = (10 * log10(PLightWavelet));
PercentageSELWavelet= (100- 10.^(-SELightWavelet/10));

%Plotting data
%Max signal dBm
f1 = figure(1);
cla; hold on; grid on;
plot(xData0dBm,y1Data0dBm); % max
plot(xData0dBm,MaxNoShielddBm); % max

legend('Light blaket','No shield')
ylim([-85 0])
title('Power level (dBm) vs Frequency (Hz) FFT Hann Light Blanket Shield Transmitter 10 dBm 40 cm from Shield MAX signal');

xlabel('Frequency (Hz)');
ylabel('Power Level (dBm)');

%Average signal dBm
f2 = figure(2);
cla; hold on; grid on;
plot(xData0dBm,y2Data0dBm); % max
plot(xData0dBm,AverageNoShielddBm); % max

legend('Light blaket','No shield')
ylim([-85 0])
title('Power level (dBm) vs Frequency (Hz) FFT Hann Light Blanket Shield Transmitter 10 dBm 40 cm from Shield AVG signal');

xlabel('Frequency (Hz)');
ylabel('Power Level (dBm)');

%Max signal Watt
f3 = figure(3);
cla; hold on; grid on;
plot(xData0Watt,y1Data0Watt); % max
plot(xData0Watt,MaxNoShieldWatt); % max

legend('Light blaket','No shield')
%ylim([-85 0])
title('Power level (Watt) vs Frequency (Hz) FFT Hann Light Blanket Shield Transmitter 10 dBm Different distances from Shield MAX signal');

xlabel('Frequency (Hz)');
ylabel('Power Level (Watt)');


%Shielding effectiveness Watt
f4 = figure(4);
cla; hold on; grid on;
plot(xData0Watt,SELight,'b-'); % max
ylim([-0 60]);
xlabel('Frequency (Hz)');
ylabel('SE (dB)');
title('Shielding Effectiveness Light Blanket(dB) FFT Hann 40 cm');


%Shielding effectiveness Percentage Watt
f5 = figure(5);
cla; hold on; grid on;
plot(xData0Watt,PercentageSEL,'b-'); % max
ylim([-10 110]);
xlabel('Frequency (Hz)');
ylabel('SE Percentage (%)');
title('Shielding Effectiveness Light Blanket(dB) Percentage FFT Hann 40 cm ');

f6 = figure(6);
plot(xData0Watt,y1Data0Watt);axis tight;grid on;title("Noisy Signal")

f7 = figure(7);
plot(fd);axis tight;grid on; title('Denoised Signal SNR:');

f8 = figure(8);
subplot(4,1,1)
plot(LightMaxWavelet);
title('Approximation at Level 3');
subplot(4,1,2)
plot(d3)
title('Detail Coefficients at Level 3');
subplot(4,1,3)
plot(d2)
title('Detail Coefficients at Level 2');
subplot(4,1,4)
plot(d1)
title('Detail Coefficients at Level 1');


%Shielding effectiveness Watt
f9 = figure(9);
cla; hold on; grid on;
plot(FrequencyWavelet,SELightWavelet,'k-'); % max
ylim([-20 60]);
xlabel('Frequency(MHz)');
ylabel('SE (dB)');
title('Shielding Effectiveness Light Blanket(dB) Average signal FFT Hann 40 cm Wavelet denoising Level 5');
xlim([0,6000])
%xticklabels({'0.38','1','2','3','4','5','6'})

%Shielding effectiveness Percentage Watt
f10 = figure(10);
cla; hold on; grid on;
plot(FrequencyWavelet,PercentageSELWavelet,'k-'); % max
ylim([-10 110]);
xlim([0,6000])
xlabel('Frequency(MHz)');
ylabel('SE Percentage (%)');
title('Shielding Effectiveness Light Blanket(dB) Percentage Average signal FFT Hann 40 cm Wavelet denoising Level 5');
%xticklabels({'0.38','6'})
