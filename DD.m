function varargout = DD(varargin)
% DD MATLAB code for DD.fig
%      DD, by itself, creates a new DD or raises the existing
%      singleton*.
%
%      H = DD returns the handle to a new DD or the handle to
%      the existing singleton*.
%
%      DD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DD.M with the given input arguments.
%
%      DD('Property','Value',...) creates a new DD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DD

% Last Modified by GUIDE v2.5 20-Apr-2013 16:46:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DD_OpeningFcn, ...
                   'gui_OutputFcn',  @DD_OutputFcn, ...
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


% --- Executes just before DD is made visible.
function DD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DD (see VARARGIN)

% Choose default command line output for DD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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
% Newton's Divided Difference interpolating polynomial
% usage; the input are two vectors X and Y that represent points.
%function [] = nddp(X,Y)
 
%x = X; y = Y;
 x = str2num(get(handles.edit2,'string'));
 y=  str2num(get(handles.edit3,'string')); 
 %'x=[-5,0,7,12,25]'    [0, 1, 2, 4]
 %' y=[-12,4,15,8,2]'   [1, 1, 2, 5]
n = length(x);
 
if length(x) ~= length(y)
 error('X and Y must have the same dimension')
end
 
% inserting x into 1st column of DD-table
DD(1:length(x),1) = x;
 
% inserting y into 2nd column of DD-table
DD(1:length(y),2) = y;
 
% creates divided difference coefficients
for j = 1:n-1
 for k = 1:n-j % j goes from 1 to n-1
 DD(k,j+2) = (DD(k+1,j+1)-DD(k,j+1))/(DD(k+j,1)-DD(k,1));
 end
end
 
% Create a matrix Prod, that has DD(1,3)*(x-x(1)) in the first row,
% DD(1,4)*(x-x(2)) in the second and so on.
 
% We first create a n-1 by n matrix of zeros. If we have n points, we will
% get a n-1 degree polynomial.
Prod = zeros(n-1,n);
p = conv(1,[1,-x(1)]); % creates a poly (x-x(1))
 
for i = 1:n-1
 Prod(i,(n-(length(p)-1)):n) = DD(1,i+2)*p;
 p = conv(p,[1,-x(i+1)]);
end
 
% sum the columns of the matrix Prod to produce the polynomial P
P = sum(Prod,1);
% add y(1) to the last element of P, which is a_0 in a polynomial
P(1,n)=P(1,n)+y(1);
%  
% % plot polynomial p for values x_eval
%x_eval = min(x):0.1:max(x);
% y_eval = polyval(P,x_eval);
% plot(x_eval,y_eval); hold on;
%  
% % plot points used
% for i = 1:n
%  plot(x(i),y(i),'or');
% end
%  
%Coefficients = DD(1,3:end)
set (handles.text5,'string',DD(1,3:end));
%set (handles.text5,'string',DD(k,j+2));
%set (handles.text7,'string',DD(k,j+2));
