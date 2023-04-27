clc;
clear all; 
close all;


DataTable = readtable("E:\EMF\Data Sergio\Distance from center\No shield\Hann Transmitter 10 dBm 40 cm from center No shield dBm.csv");
Frequency = DataTable{7,1};
Max = DataTable{8,1};
Average = DataTable{17,1};



% Split the strings in the cell and concatenate the resulting arrays vertically
FrequencyTranspose = vertcat(split(Frequency, ', '));
MaxTranspose = vertcat(split(Max, ', '));
AverageTranspose = vertcat(split(Average, ', '));

% Display the resulting column
%disp(MaxTranspose);



% Create a table from the arrays and specify the column headers
T = table(FrequencyTranspose, MaxTranspose, AverageTranspose, 'VariableNames', {'Frequency', 'Max', 'Average'});

% Delete the first row of the table
T(1,:) = [];

% Write the table to a CSV file
writetable(T, 'E:\EMF\Data Sergio\Distance from center\No shield\Transpose Hann Transmitter 10 dBm 40 cm from center No shield dBm.csv')

