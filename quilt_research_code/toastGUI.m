function varargout = toastGUI(varargin)
% TOASTGUI MATLAB code for toastGUI.fig
%      TOASTGUI, by itself, creates a new TOASTGUI or raises the existing
%      singleton*.
%
%      H = TOASTGUI returns the handle to a new TOASTGUI or the handle to
%      the existing singleton*.
%
%      TOASTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOASTGUI.M with the given input arguments.
%
%      TOASTGUI('Property','Value',...) creates a new TOASTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before toastGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to toastGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help toastGUI

% Last Modified by GUIDE v2.5 24-Apr-2013 11:55:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @toastGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @toastGUI_OutputFcn, ...
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


% --- Executes just before toastGUI is made visible.
function toastGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to toastGUI (see VARARGIN)


handles.face = im2double(imresize(imread('bill.jpg'), 2, 'bilinear'));
handles.toast = im2double(imread('toastSample.jpg'));
handles.toastOut = im2double(imread('toast.jpg'));

handles.toastFace = simplexferfun(handles.toast,handles.face,30,1);

%handles.output = simplexferfun(handles.toastFace,handles.toastOut,60,1);

% mask = zeros(500, 1000, 3, 'double');
% mask2 = ones(500, 1000, 3, 'double');
% 
% for i = 1:1:1000
%     j = 500*cosd(i*360/1000);
%     for z = 1:1:j
%         mask(z,i,1)=1;
%         mask(z,i,2)=1;
%         mask(z,i,3)=1;
%     end
% end
% 
% mask2 = mask2-mask;
% 
% handles.output = image(mask2.*handles.toastFace + mask.*handles.toastOut);




imshow(handles.output, 'Parent', handles.axes1);



% Choose default command line output for toastGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes toastGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = toastGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
