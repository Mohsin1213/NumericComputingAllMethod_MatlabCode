function varargout = lang(varargin)
% LANG MATLAB code for lang.fig
%      LANG, by itself, creates a new LANG or raises the existing
%      singleton*.
%
%      H = LANG returns the handle to a new LANG or the handle to
%      the existing singleton*.
%
%      LANG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LANG.M with the given input arguments.
%
%      LANG('Property','Value',...) creates a new LANG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lang_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lang_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lang

% Last Modified by GUIDE v2.5 20-Apr-2013 04:37:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lang_OpeningFcn, ...
                   'gui_OutputFcn',  @lang_OutputFcn, ...
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


% --- Executes just before lang is made visible.
function lang_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lang (see VARARGIN)

% Choose default command line output for lang
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lang wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lang_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% % lanrange%
% function yi = lagrint(x,y,xi)
% lagrint  Interpolation with Lagrange polynomials of arbitrary degree
%
% Synopsis:  yi = lagrint(x,y,xi)
%
% Input:   x,y = tabulated data
%          xi  = point where interpolation is to be evaluated
%
% Output:    yi = value of y at x = xi obtained via interpolation with
%                 polynomial of degree n-1, where length(y) = length(x) = n
x=str2num(get(handles.edit1,'string'));
y=str2num(get(handles.edit2,'string'));
xi=str2num(get(handles.edit3,'string'));
dxi = xi - x;        %  vector of xi - x(1), xi - x(2), ... values
n = length(x);       %  degree of polynomial is n-1
L = zeros(size(y));  %  preallocate L for speed

%  Refer to section 10.2.2 in text for explanation of vectorized code
%  used to compute Lagrange basis functions, L(j)
L(1) = prod(dxi(2:n))/prod(x(1)-x(2:n));       %  j = 1
L(n) = prod(dxi(1:n-1))/prod(x(n)-x(1:n-1));   %  j = n
for j=2:n-1
  num = prod(dxi(1:j-1))*prod(dxi(j+1:n));
  den = prod(x(j)-x(1:j-1))*prod(x(j)-x(j+1:n));
  L(j) = num/den;
end
yi = sum(y.*L);      %  Evaluate Polynomial: sum of y(j)*L(j), j=1..n
set(handles.text4,'string',yi);








