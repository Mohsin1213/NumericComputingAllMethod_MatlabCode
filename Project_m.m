function varargout = Project_m(varargin)
% PROJECT_M MATLAB code for Project_m.fig
%      PROJECT_M, by itself, creates a new PROJECT_M or raises the existing
%      singleton*.
%
%      H = PROJECT_M returns the handle to a new PROJECT_M or the handle to
%      the existing singleton*.
%
%      PROJECT_M('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_M.M with the given input arguments.
%
%      PROJECT_M('Property','Value',...) creates a new PROJECT_M or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_m_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_m_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project_m

% Last Modified by GUIDE v2.5 14-Apr-2016 20:49:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_m_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_m_OutputFcn, ...
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


% --- Executes just before Project_m is made visible.
function Project_m_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project_m (see VARARGIN)

% Choose default command line output for Project_m
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project_m wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_m_OutputFcn(hObject, eventdata, handles) 
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

varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)

[fname, pname] = uigetfile({'*.*'}, 'Browser');

global img
global face_detector
img = imread([pname fname]);
imshow(img,'Parent',handles.axes1);


face_detector = vision.CascadeObjectDetector;


temp = step(face_detector, img);


box = insertObjectAnnotation(img, 'rectangle', temp, 'Detected');
imshow(box), title('Detected Faces');

%Croping working...

counter=1;
for i=1:N
    face=imcrop(img,BB(i,:));
    baseDir  = 'C:\Users\home\Desktop\croping\Pic.jpg';
    newName  = [baseDir num2str(counter) '.jpg'];
    while exist(newName,'file')
        
        counter = counter + 1;
        newName = [baseDir num2str(counter) '.jpg'];
    end
    fac=imresize(face,[110,92]);
    imwrite(fac,newName);

figure(2);
imshow(face); 
title('crop pic');
   
    pause(1);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img
global face_detector
negative=img;
neg_img=imcomplement(negative);
imshow(neg_img,'Parent',handles.axes1);

temp = step(face_detector, img);


box = insertObjectAnnotation(neg_img, 'rectangle', temp, 'Detected');
imshow(box), title('Detected Faces');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img
global face_detector
black=img;
black_img=im2bw(black);
imshow(black_img,'Parent',handles.axes1);

temp = step(face_detector, img);


box = insertObjectAnnotation(black_img, 'rectangle', temp, 'Detected');
imshow(box), title('Detected Faces');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img
global face_detector
grey=img;
grey_img=rgb2gray(grey);
imshow(grey_img,'Parent',handles.axes1);

temp = step(face_detector, img);


box = insertObjectAnnotation(grey_img, 'rectangle', temp, 'Detected');
imshow(box), title('Detected Faces');
