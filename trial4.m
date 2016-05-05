function line1 = trial4()
h.fig = figure('position', [200 200 800 400]);
h.buttonOne = uicontrol('style', 'pushbutton',...
    'position', [550 325 50 50],...
    'string', 'E');

ax1 = subplot(1, 2, 1);
ax2 = subplot(1, 2, 1);
line1 = line(ax1, NaN, NaN, 'Color', 'Red');
x = 0;
while 1
    x = x + 1;
    y = sin(x);
    x1 = get(line1, 'xData');
    y1 = get(line1, 'yData');
    x1 = [x1 x];
    y1 = [y1 y];
    set(line1, 'xData', x1, 'yData', y1);
    hold on;
    scatter(ax2, x, y, 'MarkerFaceColor', 'red');

    pause(0.1);
    axis([x - 100 x + 100 -1.5 1.5]);
    
    %n = get(gca, 'CurrentPoint');
    %text(newpoint(1) + 100,sin(newpoint(1)), num2str(newpoint(1)));
    set(h.buttonOne, 'callback','press(a,sin(a))');
    
end

    function press(i, j)
        hold on;
        scatter(i, j);
    end

end