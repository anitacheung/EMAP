function line1 = trial4()
h.fig = figure('position', [200 200 800 400]);
h.buttonOne = uicontrol('style', 'pushbutton',...
    'position', [650 325 50 50],...
    'string', 'Endo');

h.buttonTwo = uicontrol('style', 'pushbutton',...
    'position', [650 250 50 50],...
    'string', 'TOF');

h.buttonThree = uicontrol('style', 'pushbutton',...
    'position', [650 175 50 50],...
    'string', 'Fade');

h.buttonFour = uicontrol('style', 'pushbutton',...
    'position', [650 100 50 50],...
    'string', 'Recovery');

h.buttonFive = uicontrol('style', 'pushbutton',...
    'position', [650 25 50 50],...
    'string', 'Extubation');

ax1 = subplot('Position', [0.1 0.15 0.6 0.75]);
ax2 = subplot('Position', [0.1 0.15 0.6 0.75]);
h.line1 = line(ax1, NaN, NaN, 'Color', 'Red');
x = 0;
while 1
    title('EMAP');
    xlabel('Time');
    ylabel('Pressure [mmHg]');
    x = x + 1;
    y = sin(x);
    x1 = get(h.line1, 'xData');
    y1 = get(h.line1, 'yData');
    x1 = [x1 x];
    y1 = [y1 y];
    set(h.line1, 'xData', x1, 'yData', y1);
    hold on;
%     press;
    %scatter(ax2, x, y, 'MarkerFaceColor', 'blue');

    pause(0.1);
    axis([x - 100 x + 100 -1.5 1.5]);
    hold on;
    set(h.buttonOne, 'callback', @press);
    
end

    function press(hObject, callbackdata);
        hold on;
%         ax2 = subplot('Position', [0.1 0.15 0.6 0.75]);
%         a = hObject.get(gca, 'CurrentPoint');
%         b = sin(a);
        scatter(ax2, x, y, 'MarkerFaceColor', 'blue');
    end
end