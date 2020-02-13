function [status] = drawRays(raysIn,raysOut,LIn,LOut,rayColors)
% Draws lines between sets of rays in current figure
% By Eric Landahl, February 13, 2020
% To use with createRays.m, rayTraceDemo.m, and component functions
% Outputs: 
%   status goes from 0 to 1 once drawing is complete
%   uses current figure
% Inputs:
%   raysIn (2xn) is a set of n ray matrices 
%   raysOut (2xn) is a set of n ray matrices
%   LIn distance from optical system origin where raysIn are located
%   Lout distance from opptical system origin where raysOut are located
%   rayColors (3xn) a color for each ray in [R G B] format
status = 0;  %Starting drawing
size(raysIn,2)
for i = 1:size(raysIn,2)
    X = [LIn LOut];
    Y = [raysIn(1,i) raysOut(1,i)];
    line(X,Y,'LineStyle','-','Color',rayColors(:,i))
end
status = 1; % Drawing completed