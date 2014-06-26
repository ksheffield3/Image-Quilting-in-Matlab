function varargout = textGUI(varargin)
% TEXTGUI MATLAB code for textGUI.fig
%      TEXTGUI, by itself, creates a new TEXTGUI or raises the existing
%      singleton*.
%
%      H = TEXTGUI returns the handle to a new TEXTGUI or the handle to
%      the existing singleton*.
%
%      TEXTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEXTGUI.M with the given input arguments.
%
%      TEXTGUI('Property','Value',...) creates a new TEXTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before textGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to textGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help textGUI

% Last Modified by GUIDE v2.5 20-Apr-2013 23:24:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
sampSize = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @textGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @textGUI_OutputFcn, ...
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


% --- Executes just before textGUI is made visible.
function textGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to textGUI (see VARARGIN)

% Choose default command line output for textGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes textGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%sampSize = 0;

% --- Outputs from this function are returned to the command line.
function varargout = textGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%tile = im2double(imread('btile.tif'));
%tile = im2double(imread('btile.tif'));


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tile = im2double(imread('btile.tif'));
out = synthfun(tile, 20, 1);


% --- Executes on button press in button20.
function button20_Callback(hObject, eventdata, handles)
% hObject    handle to button20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of button20
%tile = im2double(imread('btile.tif'));
if get(hObject, 'Value') ==1
    %tile = im2double(imread('btile.tif'));
       sampSize = 20;
      
end;

