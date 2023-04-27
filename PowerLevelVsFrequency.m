fid = fopen('C:\Users\100558230\Documents\Aaronia AG\Data Sergio\SinWave\Signal off Angle 315 degrees 130 cm apart 100 MHz to 6GHz Transpose.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData0Off = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data0Off = readData{1,2}(:,1);
y2Data0Off = readData{1,3}(:,1);

fid = fopen('C:\Users\100558230\Documents\Aaronia AG\Data Sergio\SinWave\Signal on Angle 315 degrees 130 cm apart 100 MHz to 6GHz Transpose.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData0On = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data0On = readData{1,2}(:,1);
y2Data0On = readData{1,3}(:,1);

%Plotting data
f1 = figure(1);
cla; hold on; grid on;

plot(xData0Off,y1Data0Off,'k-'); % max
%plot(xData0Off,y2Data0Off,'r-');  %average

plot(xData0On,y1Data0On,'b-');  %max 
%plot(xData0On,y2Data0On,'b-');   %average

%legend('Max','Avg')
legend('Signal Off','Signal On')
ylim([-100 0])
%title('Signal off Angle 0 degrees 130 cm apart 100 MHz to 6GHz');
title('Signal off vs on Angle 315 degrees 130 cm apart 100 MHz to 6GHz');
xlabel('Freqeuncy (Hz)');
ylabel('Power Level (dBm)');
