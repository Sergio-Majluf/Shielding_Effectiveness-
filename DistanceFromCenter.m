clc;
clear all; 
close all;

fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 0 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData0 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data0 = readData{1,2}(:,1);
y2Data0 = readData{1,3}(:,1);

%{
fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 5 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData5 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data5 = readData{1,2}(:,1);
y2Data5 = readData{1,3}(:,1);
%}

fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 10 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData10 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data10 = readData{1,2}(:,1);
y2Data10 = readData{1,3}(:,1);


fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 15 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData15 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data15 = readData{1,2}(:,1);
y2Data15 = readData{1,3}(:,1);

fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 20 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData20 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data20 = readData{1,2}(:,1);
y2Data20 = readData{1,3}(:,1);

%{
fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 25 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData25 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data25 = readData{1,2}(:,1);
y2Data25 = readData{1,3}(:,1);
%}

%{
fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 30 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData30 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data30 = readData{1,2}(:,1);
y2Data30 = readData{1,3}(:,1);
%}


fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 35 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData35 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data35 = readData{1,2}(:,1);
y2Data35 = readData{1,3}(:,1);


fid = fopen('E:\EMF\Data Sergio\Distance from center\Light blanket Shield\Transpose Hann Transmitter 10 dBm 40 cm from center Light blanket shield Watt.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData40 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data40 = readData{1,2}(:,1);
y2Data40 = readData{1,3}(:,1);


DataTableNoShield = readtable("E:\EMF\Data Sergio\Distance from center\No shield\Transpose Hann Transmitter 10 dBm 20 cm from center No shield Watt.csv");
FrequencyNoShield = DataTableNoShield{:,1};
MaxNoShield = DataTableNoShield{:,2};
AverageNoShield = DataTableNoShield{:,3};

a = input('Enter the # of filtering:');
t2 = ones(1,a);
num = (1/a)*t2;
den = [1];

MaxLight0cmfiltered = filter(num,den,y1Data0);
%MaxLight5cmfiltered = filter(num,den,y1Data5);
MaxLight10cmfiltered = filter(num,den,y1Data10);
MaxLight15cmfiltered = filter(num,den,y1Data15);
MaxLight20cmfiltered = filter(num,den,y1Data20);
%MaxLight25cmfiltered = filter(num,den,y1Data25);
%MaxLight30cmfiltered = filter(num,den,y1Data30);
MaxLight35cmfiltered = filter(num,den,y1Data35);
MaxLight40cmfiltered = filter(num,den,y1Data40);
MaxNoShield20cmfiltered = filter(num,den,MaxNoShield);

%MaxNoShieldfiltered = filter(num,den,MaxNoShield);

% Shielding Effectiveness = 10Log10(P1/P2) =10Log10(No Shield /Shielded )
%PWeighted = ((MaxNoShield0cmfiltered)./(MaxWeightedfiltered));
PLight = ((MaxNoShield20cmfiltered)./(MaxLight20cmfiltered));

%SEWeighted =(10 * log10(PWeighted));
SELight = (10 * log10(PLight));

% P SE = MAx - NO shield 
%(100- 1^(-SE/10))*100
%PercentageSEW= (100- 10.^(-SEWeighted/10));
PercentageSEL= (100- 10.^(-SELight/10));


%Plotting data
f1 = figure(1);
cla; hold on; grid on;

plot(xData0,y1Data0); % max
%plot(xData5,y1Data5);  %max 
plot(xData10,y1Data10);  %max 
plot(xData15,y1Data15);  %max
plot(xData20,y1Data20);  %max
%plot(xData25,y1Data25);  %max 
%plot(xData30,y1Data30);  %max
plot(xData35,y1Data35);  %max 
plot(xData40,y1Data40);  %max 

%{
plot(xData0,y2Data0,'r-');      %average
plot(xData5,y2Data45,'b-');    %average
plot(xData10,y2Data90,'k-');     %average 
%plot(xData15,y2Data180,'c-');  %average
%plot(xData20,y2Data270,'y-');  %average 
%}


%legend('Max','Avg')
legend('0 cm','5 cm','10 cm','15 cm','20 cm','25 cm','30 cm','35 cm','40 cm')
%ylim([-100 0])
ylim([-85 0])
title('Power level (dBm) vs Frequency (Hz) FFT Hann Light Blanket Shield Transmitter 10 dBm Different distances from Shield');
%title('Signal off vs on Angle 315 degrees 130 cm apart 100 MHz to 6GHz');
xlabel('Frequency (Hz)');
ylabel('Power Level (dBm)');

f2 = figure(2);
cla; hold on; grid on;
plot(xData0,MaxLight0cmfiltered); % max
%plot(xData5,MaxLight5cmfiltered);  %max 
plot(xData10,MaxLight10cmfiltered);  %max 
plot(xData15,MaxLight15cmfiltered);  %max
plot(xData20,MaxLight20cmfiltered);  %max
%plot(xData25,MaxLight25cmfiltered);  %max 
%plot(xData30,MaxLight30cmfiltered);  %max 
plot(xData35,MaxLight35cmfiltered);  %max 
plot(xData40,MaxLight40cmfiltered);  %max 
ylim([-85 0])
legend('0 cm','5 cm','10 cm','15 cm','20 cm','25 cm','30 cm','35 cm','40 cm')
title('Power level (dBm) vs Frequency (Hz) FFT Hann Light Blanket Shield Transmitter 10 dBm Different distances from Shield Filtered');
xlabel('Frequency (Hz)');
ylabel('Power Level (dBm)');

f3 = figure(3);
cla; hold on; grid on;
plot(xData0,MaxNoShield20cmfiltered); % max
plot(xData0,MaxLight20cmfiltered);  %max 
legend('No Shield 0 cm','Light Blanket 0 cm')
title('Power level (dBm) vs Frequency (Hz) FFT Hann Light Blanket Shield Transmitter 10 dBm Different distances from Shield Filtered');
ylim([0 3E-5]);
xlabel('Frequency (Hz)');
ylabel('Power Level (Watt)');

f4 = figure(4);
cla; hold on; grid on;
%[up,lo]=envelope(SELight,100,"analytic");
plot(xData0,SELight,'k-'); % max
%plot(FrequencyWeighted,[up,lo],'r-'); % max
ylim([-20 50]);
xlabel('Frequency (Hz)');
ylabel('SE (dB)');
title('Shielding Effectiveness Light Blanket(dB) FFT Hann 20 cm 100 Filtering');

f5 = figure(5);
cla; hold on; grid on;
%[up,lo]=envelope(SELight,100,"analytic");
plot(xData0,PercentageSEL,'k-'); % max
%plot(FrequencyWeighted,[up,lo],'r-'); % max
ylim([70 100]);
xlabel('Frequency (Hz)');
ylabel('SE (dB)');
title('Shielding Effectiveness Light Blanket(dB) Percentage FFT Hann 20 cm 100 Filtering');