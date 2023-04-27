clc;
clear all; 
close all;


DataTable = readtable("E:\EMF\Data Sergio\95 cm antenna apart\No shield Different Transmitter Power levels\Transpose DirectSignalGeneratorV6 Closed Box Antenna 95 cm apart Hamming FFt Signal on Max and average No shield Transmitter Power Level 0 dBm Trial 2.csv");
Frequency = DataTable{:,1};
MaxNoShield = DataTable{:,2};
AverageNoShield = DataTable{:,3};

DataTable = readtable("E:\EMF\Data Sergio\95 cm antenna apart\Bubble Wrap Aluminum Different Transmitter Power levels\Transpose DirectSignalGeneratorV6 Closed Box Antenna 95 cm apart Hamming FFt Signal on Max and average BubbleWrap shield Transmitter Power Level 0 dBm Trial 2.csv");
FrequencyBubble = DataTable{:,1};
MaxBubble = DataTable{:,2};
AverageBubble = DataTable{:,3};


% Shielding effectiveness (dB) = Power attenuation (dBm) - 30 dB
% Power attenuation (dB) = Received power level (dBm) - Transmit power level (dBm)
% SE% (dBm) = (1 - 10^(SE(dBm/10)) * 100%
Incident = MaxNoShield ;
Transmitted = MaxBubble ;
SE_dB = (Incident - Transmitted) ;
%SE_dBm = 10*log10(abs(Incident./Transmitted));
SE_dBm = 10*log(abs(Incident./Transmitted));
Percentage = ((Incident - Transmitted) ./ (Incident)) * 100 ;
%SE_Percentage = (1 - 10 .^(SE_dBm ./ 10)) * 100;
%SE_dBPercentage = (1 - 10.^(-(SE_dB)./10)) * 100;
SE_dBPercentage = (100 - (1/10.^(SE_dB./10))) * 100;

% Create a table from the arrays and specify the column headers
%Table = table(Frequency, MaxNoShield, AverageNoShield, Incident, Transmitted, SE_dB, SE_dBPercentage, 'VariableNames', {'Frequency', 'Max No Shield', 'Average No Shield','Incident','Transmitted','SE db', 'Se Percentage dB'});

% Write the table to a CSV file
%writetable(Table, 'E:\EMF\Data Sergio\95 cm antenna apart\Shielding Effectiveness\Shielding Effectinvess No shield vs Bubble Wrap Max.csv')


%{
%Plotting data
f1 = figure(1);
cla; hold on; grid on;




plot(Frequency,SE_dBPercentage,'r-'); % max

%{
plot(xData1,y2Data1,'r');      %average
%}

legend('Shielding Effectiveness %');
%ylim([-85 0])
%ylim([-85 -70])
%xlim([380000000 980000000])
%xlim([380000000 1980000000])
%xlim([2000000000 4000000000])
%xlim([3000000000 3500000000])
%xlim([1000000000 1400000000])

%ylim([-85 -60])
title('Shielding Effectiveness (%) vs Frequency Max Hold Transmitter Power 0 dBm BubbleWrap Aluminum Shield');
%title('Signal off vs on Angle 315 degrees 13 cm apart 10 MHz to 6GHz');
xlabel('Frequency (Hz)');
ylabel('Shielding Effectiveness (%)');


f2 = figure(2);
cla; hold on; grid on;

plot(Frequency,SE_dB,'r-'); % max
title('Shielding Effectiveness (dB) vs Frequency Max Hold Transmitter Power 0 dBm BubbleWrap Aluminum Shield Max');
legend('Shielding Effectiveness %');
xlabel('Frequency (Hz)');
ylabel('Shielding Effectiveness (dB)');

f3 = figure(3);
cla; hold on; grid on;

plot(Frequency,SE_dBPercentage,'r-'); % max
title('Shielding Effectiveness Percentage (dB) vs Frequency Max Hold Transmitter Power 0 dBm BubbleWrap Aluminum Shield Max');
legend('Shielding Effectiveness %');
xlabel('Frequency (Hz)');
ylabel('Shielding Effectiveness (dB)');
%}
f4 = figure(4);
cla; hold on; grid on;
%plot(Frequency,MaxNoShield,'r-'); % max
%plot(Frequency,MaxBubble,'k-'); % max
%plot(Frequency,Percentage); % max
plot(Frequency,SE_dBPercentage); % max
