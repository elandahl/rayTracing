function raysOut = freeSpace(raysIn,L)
% Propagates a set of rays over a distance L in free space
% EL 3/10/2020
%
M = [1 L;
     0 1];
 
 raysOut = M*raysIn;
 