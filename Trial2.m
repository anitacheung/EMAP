h.buttonOne = uicontrol('style', 'pushbutton',...
    'position', [550 325 50 50],...
    'string', 'E',...
    'Callback', @button);

% %% Rendition 2: taking arduino data and plotting as a line
% line(NaN, NaN, 'Color', 'Red');
% x = 0;
% while 1
%     voltage1 = readVoltage(a, 'A0'); 
%     resistance1 = ((5 - voltage1)*10000)/voltage1; 
%     conductance1 = 1000000/resistance1; 
%     force1 = conductance1/80;
%     pressure1 = force1/0.0003;
%     x1 = get(line1, 'xData'); 
%     y1 = get(line1, 'yData'); 
%     x1 = [x1 i]; 
%     y1 = [y1 pressure1];
%     set(line1, 'xData', x1, 'yData', y1);
%     i = i+1; 
%     pause(1);
% end


h.fig = get(groot, 'CurrentFigure');
%% Rendition 1b: plotting sine graph
line1 = line(NaN, NaN, 'Color', 'Red');
x = 0;
while 1
    x = x + 1;
    y = sin(x);
    x1 = get(line1, 'xData');
    y1 = get(line1, 'yData');
    x1 = [x1 x];
    y1 = [y1 y];
    set(line1, 'xData', x1, 'yData', y1);
    pause(0.1);
    axis([x - 100 x + 100 -1.5 1.5]);
    
    newpoint = get(gca, 'CurrentPoint');
    %text(newpoint(1) + 100, 0, num2str(newpoint(1)));
    set(h.buttonOne, 'callback', @button);
    
end
    

% %% Rendition 1: just plotting sine graph
% while 1
%     x = x + 1;
%     y = sin(x);
%     scatter(x, y, 'MarkerFaceColor', 'Black');
%     pause(0.001);
% end