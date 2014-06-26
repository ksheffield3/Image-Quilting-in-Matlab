function varargout = cloneTest(varargin)
% CLONETEST MATLAB code for cloneTest.fig
%      CLONETEST, by itself, creates a new CLONETEST or raises the existing
%      singleton*.
%
%      H = CLONETEST returns the handle to a new CLONETEST or the handle to
%      the existing singleton*.
%
%      CLONETEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLONETEST.M with the given input arguments.
%
%      CLONETEST('Property','Value',...) creates a new CLONETEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cloneTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cloneTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cloneTest

% Last Modified by GUIDE v2.5 22-Apr-2013 17:22:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cloneTest_OpeningFcn, ...
                   'gui_OutputFcn',  @cloneTest_OutputFcn, ...
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


% --- Executes just before cloneTest is made visible.
function cloneTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cloneTest (see VARARGIN)

% Choose default command line output for cloneTest
handles.butterDest1 = im2double(imresize(imread('butterDest.jpg'), 2, 'bilinear'));
handles.rice = im2double(imread('rice.jpg'));




imshow(handles.butterDest1, 'Parent', handles.axes1);
hold on;
%[ob, x, y] = freehanddraw('linestyle','-');
%h = imfreehand(handles.axes1);
[handles.X, handles.Y, handles.I, handles.rect] = imcrop(handles.axes1);
[handles.X2, handles.Y2, handles.I2, handles.rect2] = imcrop(handles.axes1);
%I2 = imcrop(I)

startY = floor(handles.rect(1));
startX = floor(handles.rect(2));
width = floor(handles.rect(3));
height = floor(handles.rect(4));
handles.rect


imshow(handles.I, 'Parent', handles.axes2);



handles.output = simplexferfun(handles.I2,handles.I,8,3);

imshow(handles.output, 'Parent', handles.axes3);
%newImg = im2double(handles.output);
%destImg = im2double(handles.butterDest1);

%get the bounding box from the cropped image and manipulate those pixels
%directly in the dest image

%newOut = simplesferfun(handles.I2, double2image(destImg(startY:(startY+width), startX:(startX+height), :)), 8, 1);
%imshow(newOut, 'Parent', handles.axes4);
%handles.output = handles.output(repmat(width,height,3));
%handles.butterDest1(startY:(startY+width-1), startX:(startX+height-1)) = handles.output(1:width-1, 1:height-1);

%handles.butterDest1(startY:(startY+width),startX:(startX+height)) = handles.output;
%for bgY = startY, bgY <= handles.rect(3)+startY, bgY = bgY+1
 %   for bgX = startX, bgX <= handles.rect(4)+startX, bgX = bgX+1
        
  %      for whys = 1, whys < height, whys = whys+1
   %         for exes = 1, exes < width, exes = exes+1
    
   %for bgY = (startY :  (handles.rect(3)+startY)-1)
    % for  bgX = (startX : (handles.rect(4)+startX)-1)
     %  for exes = (1 : (width-1))
      %   for whys = (1 : (height-1))
          %for exes = (1 : (width-1))
       %         handles.butterDest1(floor(bgY),floor(bgX), :) = handles.output(floor(whys), floor(exes), :);
                %handles.butterDest1(floor(bgY),floor(bgX), 2) = handles.output(floor(whys-1), floor(exes-1), 2);
                %handles.butterDest1(floor(bgY),floor(bgX), 3) = handles.output(floor(whys-1), floor(exes-1), 3);
               % imshow(handles.butterDest1, 'Parent', handles.axes4);
                %imshow(handles.output,  'Parent', handles.axes4);
               
                
        %%       exes = exes+1;
          %      whys = whys+1;
           %     bgX = bgX+1;
            %    bgY = bgY + 1;
    
            %end
       % end
   % end
   %end

imshow(handles.butterDest1, 'Parent', handles.axes4);
hold on;
imshow(handles.output, 'Parent', handles.axes4);
%subplot(handles.X,handles.Y, 3);
%imshow(handles.output, 'parent', handles.axes4);
%h = imshow(handles.butterDest1);
%set(h, 'AlphaData', handles.output);
%imshow(handles.output, 'XData', [handles.Y, handles.X], 'parent', handles.axes4);

%imshow(handles.output, 'Parent', handles.axes4);
%plot(handles.rect, h);





handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cloneTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cloneTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
