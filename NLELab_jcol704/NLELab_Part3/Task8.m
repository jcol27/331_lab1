%% Clear workspace
clear all;
clc;

%% Add paths to objects and materials
addpath(fullfile('.', 'raytracer'))
addpath(fullfile('.', 'raytracer/materials'))
addpath(fullfile('.', 'raytracer/objects'))

%% Set properties of the scene
frame=0; % the frame (used if object is animated)
v=[0;3;0]; % the position of the viewer
l=[-1;2;0]; % the position of the lightsource
a=0.2; % the amount of ambient light 0-1
quality=2; % the quality of the surface lighting 0-4

%% You may wish to change these options
res=256; % resolution (the output image will be square)
bg=[1;1;1]; % the colour of the backgroud (each component is 0-1).
obj=@spiral; % the object to be rendered
mat=@glossyred; % the material of the object

%% Render the scene
data=renderScene(res,quality,v,l,a,bg,obj,mat,frame);

%% Display the rendered image
imshow(data);
axis equal;
drawnow;

%imwrite(data,['image' num2str(frame) '.png']);
