fid = fopen('E:\EMF\Data Sergio\95 cm antenna apart\No shield Different Transmitter Power levels\Transpose DirectSignalGeneratorV6 Closed Box Antenna 95 cm apart Hamming FFt Signal on Max and average No shield Transmitter Power Level Minus 10 dBm Trial 3.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData1 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data1 = readData{1,2}(:,1);
y2Data1 = readData{1,3}(:,1);


fid = fopen('E:\EMF\Data Sergio\95 cm antenna apart\Nickle Sheet Different Transmitter Power levels\Transpose DirectSignalGeneratorV6 Closed Box Antenna 95 cm apart Hamming FFt Signal on Max and average Nickle shield Transmitter Power Level Minus 10 dBm Trial 2.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData2 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data2 = readData{1,2}(:,1);
y2Data2 = readData{1,3}(:,1);

fid = fopen('E:\EMF\Data Sergio\95 cm antenna apart\Bubble Wrap Aluminum Different Transmitter Power levels\Transpose DirectSignalGeneratorV6 Closed Box Antenna 95 cm apart Hamming FFt Signal on Max and average BubbleWrap shield Transmitter Power Level Minus 10 dBm Trial 2.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData3 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data3 = readData{1,2}(:,1);
y2Data3 = readData{1,3}(:,1);

%Plotting data
f1 = figure(1);
cla; hold on; grid on;

%{
plot(xData1,y1Data1,'r-'); % max
%plot(xData2,y1Data2,'b-');  %max 
plot(xData3,y1Data3,'k-');  %max 
%}


plot(xData1,y2Data1,'r');      %average
%plot(xData2,y2Data2,'b-');    %average
plot(xData3,y2Data3,'k-');     %average 



%legend('No shield','Nickle Sheet','Bubble Wrap Aluminum');
legend('No shield','Bubble Wrap Aluminum');
%ylim([-85 0])
ylim([-85 -70])
%xlim([380000000 980000000])
%xlim([380000000 1980000000])
xlim([2000000000 4000000000])
%xlim([3000000000 3500000000])
%xlim([1000000000 1400000000])

%ylim([-85 -60])
title('Power Level vs Frequency for different shields Signal on Power Transmitter Minus 10 dBm Avg');
%title('Signal off vs on Angle 315 degrees 13 cm apart 10 MHz to 6GHz');
xlabel('Frequency (Hz)');
ylabel('Power Level (dBm)');