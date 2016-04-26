function varargout = UI_01(varargin)
% UI_01 MATLAB code for UI_01.fig
%      UI_01, by itself, creates a new UI_01 or raises the existing
%      singleton*.
%
%      H = UI_01 returns the handle to a new UI_01 or the handle to
%      the existing singleton*.
%
%      UI_01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI_01.M with the given input arguments.
%
%      UI_01('Property','Value',...) creates a new UI_01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UI_01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UI_01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UI_01

% Last Modified by GUIDE v2.5 23-Apr-2016 06:30:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UI_01_OpeningFcn, ...
                   'gui_OutputFcn',  @UI_01_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before UI_01 is made visible.
function UI_01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UI_01 (see VARARGIN)
% Runs the arduino to MATLAB code

% Initialize serial port
s = serial('COM5');
%set(s, ‘ Terminator’, ‘LF’); % Default terminator is \n

% Various variables
numberOfDatas = 50;
data = zeros(1, numberOfDatas);
i = 1;
 
% Main graph figure
hold on;
title('Incomming Data from External Device');
xlabel('Data Number');
ylabel('Analog Voltage (0-1023)');

readasync(s);

while(i<=numberOfDatas)  
   
    % Get the data from the serial object
    data(i) = fscanf(s, '%d');
   
    % Plot the data
    plot(i, data(i), 'm*');
    
    % Ensure there are always 10 tick marks on the graph
    if(i>10)
       xlim([i-10 i]);
       set(gca,'tick',[i-10 i-9 i-8 i-7 i-6 i-5 i-4 i-3 i-2 i-1 i])
    end
    
    i=i+1;
end
    
% Choose default command line output for UI_01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UI_01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UI_01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Display surf plot of the currently selected data.
s = serial('COM5');
%set(s, ‘ Terminator’, ‘LF’); % Default terminator is \n

% Various variables
numberOfDatas = 50;
data = zeros(1, numberOfDatas);
i = 1;

readasync(s);
while (i<=numberOfDatas)
    data(i) = fscanf(s, '%d');
    i = i + 1;
end

plot (i, data(i));

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Delete me
% Display mesh plot of the currently selected data.
  mesh(handles.current_data);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
