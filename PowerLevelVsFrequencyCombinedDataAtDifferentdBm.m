fid = fopen('E:\EMF\Data Sergio\Different signal power and specific ranges\change in dbm\No shield\Transpose Signal on 0 dbm Center 2500 MHz 130 cm apart No Shield.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData0 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data0 = readData{1,2}(:,1);
y2Data0 = readData{1,3}(:,1);

fid = fopen('E:\EMF\Data Sergio\Different signal power and specific ranges\change in dbm\No shield\Transpose Signal on minus 10 dbm Center 2500 MHz 130 cm apart No Shield.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData10 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data10 = readData{1,2}(:,1);
y2Data10 = readData{1,3}(:,1);

fid = fopen('E:\EMF\Data Sergio\Different signal power and specific ranges\change in dbm\No shield\Transpose Signal on minus 20 dbm Center 2500 MHz 130 cm apart No Shield.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData20 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data20 = readData{1,2}(:,1);
y2Data20 = readData{1,3}(:,1);


fid = fopen('E:\EMF\Data Sergio\Different signal power and specific ranges\change in dbm\No shield\Transpose Signal on minus 30 dbm Center 2500 MHz 130 cm apart No Shield.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData300 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data300 = readData{1,2}(:,1);
y2Data300 = readData{1,3}(:,1);

fid = fopen('E:\EMF\Data Sergio\Different signal power and specific ranges\change in dbm\No shield\Transpose Signal on minus 40 dbm Center 2500 MHz 130 cm apart No Shield.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData40 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data40 = readData{1,2}(:,1);
y2Data40 = readData{1,3}(:,1);

fid = fopen('E:\EMF\Data Sergio\Different signal power and specific ranges\change in dbm\No shield\Transpose Signal on minus 50 dbm Center 2500 MHz 130 cm apart No Shield.csv');
readData = textscan(fid,'%f %f %f','HeaderLines', 1,'Delimiter',',');
xData50 = readData{1,1}(:,1); % (:,1) : means all rows, 1 is for the 1st column 
y1Data50 = readData{1,2}(:,1);
y2Data50 = readData{1,3}(:,1);


%Plotting data
f1 = figure(1);
cla; hold on; grid on;

%plot(xData0,y1Data0,'r-'); % max
%plot(xData45,y1Data45,'g-');  %max 
%plot(xData90,y1Data90,'b-');  %max 
%plot(xData180,y1Data180,'c-');  %max
%plot(xData225,y1Data225,'m-');  %max 
%plot(xData270,y1Data270,'y-');  %max 

plot(xData0,y2Data0,'r-');      %average
plot(xData10,y2Data10,'b-');    %average
plot(xData20,y2Data20,'k-');     %average 
plot(xData30,y2Data30,'c-');  %average
plot(xData40,y2Data40,'y-');  %average 
plot(xData50,y2Data50,'y-');  %average 

%legend('Max','Avg')
legend('0 dBm','-10 dBm','-20 dBm','-30 dBm','-40 dBm','-50 dBm')
%ylim([-100 0])
%ylim([-70 -45])
title('Signal on 0 dbm Center 2500 MHz 130 cm apart No Shield');
%title('Signal off vs on Angle 315 degrees 130 cm apart 100 MHz to 6GHz');
xlabel('Frequency (Hz)');
ylabel('Power Level (dBm)');
