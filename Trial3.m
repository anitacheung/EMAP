line1 = line(nan, nan, 'color', 'red'); 
line2 = line(nan, nan, 'color', 'blue'); 
i = 0; 

while 1
    voltage1 = readVoltage(a, 'A0'); 
    resistance1 = ((5 - voltage1)*10000)/voltage1; 
    conductance1 = 1000000/resistance1; 
    force1 = conductance1/80;
    pressure1 = force1/0.0003; 
    voltage2 = readVoltage(a, 'A1'); 
    resistance2 = ((5 - voltage2)*10000)/voltage2; 
    conductance2 = 1000000/resistance2;
    force2 = conductance2/80; 
    pressure2 = force2/0.0003; 
    pause(0.5); 
    
    x1 = get(line1, 'xData'); 
    y1 = get(line1, 'yData'); 
    x2 = get(line2, 'xData'); 
    y2 = get(line2, 'yData'); 
    
    x1 = [x1 i]; 
    y1 = [y1 pressure1]; 
    x2 = [x2 i]; 
    y2 = [y2 pressure2]; 
    
    set(line1, 'xData', x1, 'yData', y1); 
    set(line2, 'xData', x2, 'yData', y2); 
    
    i = i+1; 
    pause(1); 
end