% Basic Arduino and Matlab
% Communication with an external hardware device
% ———————————————-
%
% Erin Kennedy
% Jan. 18, 2010
%
 
 
clear all; clc; close all;
 
 
% Try–catch is to prevent Matlab from crashing when the program is finished
try
 
   
% Initialize serial port
s = serial('COM5');
%set(s, ‘ Terminator’, ‘LF’); % Default terminator is \n
set(s,'BaudRate', 9600);
set(s,'DataBits', 8);
set(s,'StopBits', 1);
fopen(s);
s.ReadAsyncMode = 'continuous';
 
 
% Various variables
numberOfDatas = 50;
data = zeros(1, numberOfDatas);
i = 1;
 
 
% Main graph figure
figure(1);
hold on;
title('Incomming Data from External Device');
xlabel('Data Number');
ylabel('Analog Voltage (0-1023)');
 
 
% Start asynchronous reading
readasync(s);
 
 
while(i<=numberOfDatas)  
   
   
    % Get the data from the serial object
    data(i) = fscanf(s, '%d');
   
    % Plot the data
    figure(1);
    plot(i, data(i), 'm*');
   
    % Ensure there are always 10 tick marks on the graph
    if(i>10)
       xlim([i-10 i]);
       set(gca,'tick',[i-10 i-9 i-8 i-7 i-6 i-5 i-4 i-3 i-2 i-1 i])
    end
   
    % Draw and flush
    drawnow;
   
    %Increment the counter
    i=i+1;
   
   
end
 
% Export data to Excel
xlswrite('EMAP.xls', data);
 
% Give the external device some time…
pause(3);
 
return;
 
catch
 
% Some of these crash the program — it depends. The serial port is left
% open, which is not good.                                              
stopasync(s);
fclose(s); % bad
%delete(s);
%clear s;
 
fprintf(1, 'Sorry, you''re going to have to close out of Matlab to close the serial port\n');
 
return
 
end