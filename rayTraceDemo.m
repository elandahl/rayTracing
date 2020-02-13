%% rayTraceDemo.m
% Example ray tracing program for a two lens system
% By Eric Landahl, February 13, 2020
% This script requires
%   createRays.m 
%   drawRays.m
% and the following component files containing ray matrices:
%   freeSpace.m
%   thinLens.m
%% To Dos
% Improve lens drawing commands by making it a nice function
% Add more ray matrices:
%   aperture.m (turns the color of a ray to [1 1 1] (clear) if its outside
%   thickLens.m 
% Add a realistic index of refraction model
% Add plots of image and object plane
% Use with Gaussian [ABCD] matrices to study spatial resolution
clear all;
%% Demo: two lens system
L1 = 1; % Distance from object to Lens 1
f1 = 1; % Focal length of Lens 1
L2 = 2; % Distance between Lens 1 and Lens 2
f2 = 1; % Focal length of Lens 2
L3 = 1; % Distance after Lens 2
%%  Open figure and create rays
figure(1);clf;hold on;
[rays0,rayColors] = createRays();
xlabel('Optic Axis')
yyaxis right
ylabel('Image Plane')
yyaxis left
ylabel('Object Plane')
%% Ray Tracing
% Propogate over free space distance L1
rays1 = freeSpace(rays0,L1);
drawRays(rays0,rays1,0,L1,rayColors);
% Transport through Lens 1
rays2 = thinLens(rays1,f1);
% Draw and label Lens 1
line([L1 L1],[1.1*min(rays1(1,:)) 1.1*max(rays1(1,:))],'LineStyle',':','Color',[0 0 0],'LineWidth',4) 
text(1.05*L1,1.05*min(rays1(1,:)),'f_1')
% Propogate over free space distance L2 (to location L1+L2)
rays3 = freeSpace(rays2,L2);
drawRays(rays2,rays3,L1,L1+L2,rayColors);
% Transport through Lens 2
rays4 = thinLens(rays3,f2);
% Draw and label Lens2
line([L1+L2 L1+L2],[1.1*min(rays3(1,:)) 1.1*max(rays3(1,:))],'LineStyle',':','Color',[0 0 0],'LineWidth',4) 
text(1.025*(L1+L2),1.05*min(rays3(1,:)),'f_2')
% Propogate over free space distance L3 (to location L1+L2+L3)
rays5 = freeSpace(rays4,L3);
drawRays(rays4,rays5,L1+L2,L1+L2+L3,rayColors);

