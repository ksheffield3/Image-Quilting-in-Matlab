function varargout = newGUI(varargin)
% NEWGUI MATLAB code for newGUI.fig
%      NEWGUI, by itself, creates a new NEWGUI or raises the existing
%      singleton*.
%
%      H = NEWGUI returns the handle to a new NEWGUI or the handle to
%      the existing singleton*.
%
%      NEWGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWGUI.M with the given input arguments.
%
%      NEWGUI('Property','Value',...) creates a new NEWGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newGUI

% Last Modified by GUIDE v2.5 22-Apr-2013 13:25:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @newGUI_OutputFcn, ...
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


% --- Executes just before newGUI is made visible.
function newGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newGUI (see VARARGIN)

%read in images before executing anything
handles.bill = im2double(imresize(imread('bill.jpg'),2,'bilinear'));
handles.rice = im2double(imread('rice.jpg'));

handles.potato = im2double(imread('newpotato.jpg'));
handles.orange = im2double(imread('neworange.jpg'));

handles.butterDest1 = im2double(imresize(imread('butterDest.jpg'), 2, 'bilinear'));
handles.butterDest2 = im2double(imresize(imread('butterDest2.jpg'), 2, 'bilinear'));
handles.butterDest3 = im2double(imresize(imread('butterDest3.jpg'), 2, 'bilinear'));
handles.butterDest4 = im2double(imresize(imread('butterDest4.jpg'), 2, 'bilinear'));

handles.texture1 = im2double(imread('text1.jpg'));
handles.texture2 = im2double(imread('text2.jpg'));
handles.texture3 = im2double(imread('text3.jpg')); 
handles.texture4 = im2double(imread('text4.jpg')); 

imshow(handles.texture1, 'Parent', handles.axes1);
imshow(handles.texture2, 'Parent', handles.axes2);
imshow(handles.texture3, 'Parent', handles.axes3);
imshow(handles.texture4, 'Parent', handles.axes4);

imshow(handles.butterDest1, 'Parent', handles.axes5);
imshow(handles.butterDest2, 'Parent', handles.axes6);
imshow(handles.butterDest3, 'Parent', handles.axes7);
imshow(handles.butterDest4, 'Parent', handles.axes8);

%imshow(handles.butterDest1, 'Parent', handles.axes9);
%freehanddraw('linestyle','--');



%potato_mask = rgb2gray(potato)<0.05;
%orange_mask = rgb2gray(orange)<0.1;


guidata(hObject, handles);

% Choose default command line output for newGUI
handles.output = hObject;
handles.sampSize = [];
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes newGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uipanel1.
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
handles.sampSize = [];
switch get(eventdata.NewValue,'Sample Size') % Get Tag of selected object.
    case 'samp10'
        % Code for when radiobutton1 is selected.
        handles.sampSize = 10;
        guidata(hObject, handles);
    case 'samp20'
        handles.sampSize = 20;
        guidata(hObject, handles);
    case 'samp40'
        handles.sampSize = 40;
        guidata(hObject, handles);
        
    otherwise
        % Code for when there is no match.
         handles.sampSize = 30;
         guidata(hObject, handles);
         
end
guidata(hObject, handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
%function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%handles.output = simplexferfun(handles.rice,handles.bill,handles.sampSize,1);

%guidata(hObject, handles);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

radbut = get(handles.uipanel1,'SelectedObject');
selectedRadioTag = get(radbut,'tag')
switch selectedRadioTag
   case 'samp10'
       handles.sampSize = 10;

   case 'samp20'
       handles.sampSize = 20;
    case 'samp40'
        handles.sampSize = 40;
    otherwise
        handles.sampSize = 30;
end

iterbut = get(handles.iterPanel, 'SelectedObject');
selectedRadioTag2 = get(iterbut, 'tag')
switch selectedRadioTag2 
    case 'iter1'
        handles.iterSize = 1;
    case 'iter2'
        handles.iterSize = 2;
    case 'iter4'
        handles.iterSize = 4'
    otherwise
        handles.iterSize = 1;
end



handles.output = simplexferfun(handles.texture,handles.dest,handles.sampSize,handles.iterSize);
imshow(handles.output, 'Parent', handles.axes9);
guidata(hObject, handles);


% --- Executes on selection change in textureMenu.
function textureMenu_Callback(hObject, eventdata, handles)
% hObject    handle to textureMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns textureMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from textureMenu
textSel = get(handles.textureMenu, 'Value');
%selectedText = get(textSel, 'tag');
switch textSel
    case 2
        handles.texture = handles.rice;
    case 3
        handles.texture = handles.orange;
    case 4
        handles.texture = handles.texture1;
    case 5
        handles.texture = handles.texture2;
    case 6
        handles.texture = handles.texture3;
    case 7
        handles.texture = handles.texture4;
end
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function textureMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textureMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in dest.
function dest_Callback(hObject, eventdata, handles)
% hObject    handle to dest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dest contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dest


destSel = get(handles.dest, 'Value');
%selectedDest = get(destSel, 'tag');
switch destSel
    case 2
        handles.dest = handles.bill;
        guidata(hObject, handles);
    case 3
        handles.dest = handles.potato;
        guidata(hObject, handles);
    case 4
        handles.dest = handles.butterDest1;
        guidata(hObject, handles);
    case 5
        handles.dest = handles.butterDest2;
        guidata(hObject, handles);
    case 6
        handles.dest = handles.butterDest3;
        guidata(hObject, handles);
    case 7
        handles.dest = handles.butterDest4;
        guidata(hObject, handles);
        
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function dest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
