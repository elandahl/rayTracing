function raysOut = thinLens(raysIn,f)
% Propagates a set of rays through a thin lens of focal length f and
% diameter d
% EL 3/10/2020
%
M = [1      0;
     -(1/f) 1];
 
 raysOut = M*raysIn;