function h = button(hObject, eventData, color)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

hold on;
[i, j] = hObject.get(gca, 'CurrentPoint');
h = scatter(i, j,...
    'MarkerFaceColor', 'red');

end

